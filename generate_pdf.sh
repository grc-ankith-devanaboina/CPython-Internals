#!/usr/bin/env bash
# Generate the CPython Internals PDF from the repository Markdown files.
set -euo pipefail

# Optional output file (defaults to CPython-Internals.pdf)
OUTPUT_FILE=${1:-CPython-Internals.pdf}

if ! command -v pandoc >/dev/null 2>&1; then
  echo "pandoc is required but not installed. Visit https://pandoc.org/installing.html to install it." >&2
  exit 1
fi

FILES=(
  README.md
  BasicObject/dict/dict.md
  BasicObject/long/long.md
  BasicObject/str/str.md
  BasicObject/set/set.md
  BasicObject/list/list.md
  BasicObject/tuple/tuple.md
  BasicObject/bytes/bytes.md
  BasicObject/bytearray/bytearray.md
  BasicObject/float/float.md
  BasicObject/func/func.md
  BasicObject/method/method.md
  BasicObject/iter/iter.md
  BasicObject/gen/gen.md
  BasicObject/class/class.md
  BasicObject/complex/complex.md
  BasicObject/enum/enum.md
  BasicObject/type/type.md
  Modules/io/fileio/fileio.md
  Modules/pickle/pickle.md
  Modules/re/re.md
  Interpreter/gil/gil.md
  Interpreter/gc/gc.md
  Interpreter/memory_management/memory_management.md
  Interpreter/descr/descr.md
  Interpreter/exception/exception.md
  Interpreter/module/module.md
  Interpreter/frame/frame.md
  Interpreter/code/code.md
  Interpreter/slot/slot.md
  Interpreter/thread/thread.md
  Interpreter/pyobject/pyobject.md
  Interpreter/compile/compile.md
  Interpreter/compile2/compile.md
  Interpreter/compile3/compile.md
  Extension/C/c.md
  Extension/CPP/cpp.md
)

pandoc "${FILES[@]}" \
  --toc \
  --metadata title="CPython Internals" \
  -o "${OUTPUT_FILE}"

echo "PDF generated at ${OUTPUT_FILE}"
