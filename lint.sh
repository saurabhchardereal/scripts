# SPDX-License-Identifier: GPL-3.0-or-later
#
# Copyright (C) 2021 Saurabh Charde <saurabhchardereal@gmail.com>
#
# Lint scripts using shellcheck and shfmt

# TODO: Find a better way to find executables and add them to lint list below
# maybe `fd -t x` or `find -executable`
shellcheck -s bash -e SC1090 common $(find setup/* tasks/*)
shfmt -d -ci -i 4 common $(find setup/* tasks/*)
