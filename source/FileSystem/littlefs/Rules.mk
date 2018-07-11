#
# file: Rules.mk
#
# author: Copyright (C) 2015-2016 Kamil Szczygiel http://www.distortec.com http://www.freddiechopin.info
#
# This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not
# distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

#-----------------------------------------------------------------------------------------------------------------------
# subdirectories
#-----------------------------------------------------------------------------------------------------------------------

SUBDIRECTORIES += $(patsubst $(d)%/Rules.mk,%,$(wildcard $(d)*/Rules.mk))

#-----------------------------------------------------------------------------------------------------------------------
# doxygen
#-----------------------------------------------------------------------------------------------------------------------

DOXYGEN_EXCLUDE := $(DOXYGEN_EXCLUDE) $(d)external

#-----------------------------------------------------------------------------------------------------------------------
# standard footer
#-----------------------------------------------------------------------------------------------------------------------

include $(DISTORTOS_PATH)footer.mk
