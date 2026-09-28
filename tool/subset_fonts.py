"""Regenerates fonts/ — Latin-only, unhinted static instances.

Sources: Poppins-Regular.ttf and Poppins-Bold.ttf from github.com/google/fonts (ofl/poppins),
and the Inter 4 variable font from github.com/google/fonts (ofl/inter). Run from a directory
holding the two Poppins files:

    python3 tool/subset_fonts.py path/to/Inter[opsz,wght].ttf

Everything in fonts/ is fetched before a web build's first frame, so every glyph kept costs
startup time. A character outside UNICODES makes the web engine download a Noto fallback font.
"""
import sys
from fontTools.ttLib import TTFont
from fontTools.varLib.instancer import instantiateVariableFont
from fontTools import subset
from pathlib import Path

OUT = Path(__file__).resolve().parent.parent / "fonts"

UNICODES = "U+0020-007E,U+00A0-017F,U+0218-021B,U+02BB-02BC,U+02C6,U+02DA,U+02DC,U+2000-205F,U+20A0-20CF,U+2122,U+2190-21FF,U+2212,U+2215,U+2713,U+FEFF,U+FFFD"

def write(font, out):
    opts = subset.Options()
    opts.layout_features = ["kern", "liga", "calt", "ccmp", "locl", "mark", "mkmk", "tnum"]
    opts.hinting = False
    opts.desubroutinize = True
    opts.name_IDs = ["*"]
    opts.notdef_outline = True
    s = subset.Subsetter(opts)
    s.populate(unicodes=subset.parse_unicodes(UNICODES))
    s.subset(font)
    font.save(out)

inter_src = sys.argv[1]
for name, wght in [("Regular", 400), ("Medium", 500), ("SemiBold", 600), ("Bold", 700)]:
    f = instantiateVariableFont(TTFont(inter_src), {"wght": wght, "opsz": 14}, updateFontNames=True)
    write(f, f"{OUT}/Inter-{name}.ttf")
for name in ["Regular", "Bold"]:
    write(TTFont(f"Poppins-{name}.ttf"), f"{OUT}/Poppins-{name}.ttf")
