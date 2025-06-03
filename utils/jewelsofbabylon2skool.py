#!/usr/bin/env python3
import sys
import os
import argparse
from collections import OrderedDict

try:
    from skoolkit.snapshot import get_snapshot
    from skoolkit import tap2sna, sna2skool
except ImportError:
    SKOOLKIT_HOME = os.environ.get('SKOOLKIT_HOME')
    if not SKOOLKIT_HOME:
        sys.stderr.write('SKOOLKIT_HOME is not set; aborting\n')
        sys.exit(1)
    if not os.path.isdir(SKOOLKIT_HOME):
        sys.stderr.write('SKOOLKIT_HOME={}; directory not found\n'.format(SKOOLKIT_HOME))
        sys.exit(1)
    sys.path.insert(0, SKOOLKIT_HOME)
    from skoolkit.snapshot import get_snapshot
    from skoolkit import tap2sna, sna2skool

JEWELSOFBABYLON_HOME = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BUILD_DIR = '{}/sources'.format(JEWELSOFBABYLON_HOME)
JEWELS_Z80 = '{}/JewelsofBabylon.z80'.format(JEWELSOFBABYLON_HOME)


class JewelsOfBabylon:
    def __init__(self, snapshot):
        self.snapshot = snapshot

    def get_text(self):
        """Convert the text into data.
        Seems to work nicely.
        """
        lines = []
        addr = 0xD526
        while addr < 0xE61D:
            message = ''
            start = addr
            length = 0
            while self.snapshot[addr] != 0xFF:
                byte = self.snapshot[addr]
                if 0x20 <= byte <= 0x7E:
                    message += chr(byte)
                elif byte == 0x0D:
                    message += '<CR>'
                elif byte == 0x08:
                    message += '<BS>'
                addr += 0x01
                length += 1
            lines.append('t ${:X} Messaging: {}'.format(start, message.title()))
            lines.append('  ${:X},${:02X} "#STR${:X},$08($b==$FF)".'.format(start, length, start))
            lines.append('B ${:X},$01 Terminator.'.format(addr))
            lines.append('')
            addr += 0x01

        return '\n'.join(lines)

    def get_rooms(self):
        """Creates the room table
        """
        lines = []
        addr = 0xD34E

        while addr < 0xD526:
            message = ''
            start = self.snapshot[addr+0x01]*0x100+self.snapshot[addr]
            if start > 0x0000:
                lines.append('t ${:X} Messaging:'.format(start, message.title()))
            addr += 0x02

        return '\n'.join(lines)


def run(subcommand):
    if not os.path.isdir(BUILD_DIR):
        os.mkdir(BUILD_DIR)
    if not os.path.isfile(JEWELS_Z80):
        tap2sna.main(('-d', BUILD_DIR, '@{}/jewelsofbabylon.t2s'.format(JEWELSOFBABYLON_HOME)))
    bab = JewelsOfBabylon(get_snapshot(JEWELS_Z80))
    ctlfile = '{}/{}.ctl'.format(BUILD_DIR, subcommand)
    with open(ctlfile, 'wt') as f:
        f.write(getattr(bab, methods[subcommand][0])())
    sna2skool.main(('-c', ctlfile, JEWELS_Z80))


###############################################################################
# Begin
###############################################################################
methods = OrderedDict((
    ('text', ('get_text', 'Text')),
    ('rooms', ('get_rooms', 'Rooms (49152-64767)'))
))
subcommands = '\n'.join('  {} - {}'.format(k, v[1]) for k, v in methods.items())
parser = argparse.ArgumentParser(
    usage='%(prog)s SUBCOMMAND',
    description="Produce a skool file snippet for \"Jewels Of Babylon\". SUBCOMMAND must be one of:\n\n{}".format(
        subcommands),
    formatter_class=argparse.RawTextHelpFormatter,
    add_help=False
)
parser.add_argument('subcommand', help=argparse.SUPPRESS, nargs='?')
namespace, unknown_args = parser.parse_known_args()
if unknown_args or namespace.subcommand not in methods:
    parser.exit(2, parser.format_help())
run(namespace.subcommand)
