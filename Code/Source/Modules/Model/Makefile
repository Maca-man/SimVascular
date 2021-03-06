# Hey emacs, this is a -*- makefile -*-

# Copyright (c) 2009-2011, Open Source Medical Software Corporation,
#              University of California, San Diego.
#
# All rights reserved.
#
# Portions copyright (c) 1999-2007 Stanford University,
# Nathan Wilson, Ken Wang, Charles Taylor.
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject
# to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

TOP=../../../../BuildWithMake

include $(TOP)/include.mk

CXXFLAGS = $(GLOBAL_CXXFLAGS) \
	   $(LOCAL_INCDIR) \
	   $(VTK_INCDIRS) \
	   $(TCLTK_INCDIR) \
           $(PYTHON_INCDIR) \
           $(QT_INCDIRS) $(QT_DEFS) \
	   $(ITK_INCDIRS) \
           $(MITK_INCDIRS) $(MITK_DEFS) \
           $(VMTK_INCDIR) \
	   $(SV_MMG_INCDIR) \
           $(OPENCASCADE_INCDIR) \
           $(MESHSIM_INCDIR) \
           $(PARASOLID_INCDIR)

MODULE_NAME = svModel
MODULE_NAME_ALL_CAPS = SVMODEL
CXXFLAGS += -D$(MODULE_NAME)_EXPORTS
CXXFLAGS += -DUS_MODULE_NAME="$(MODULE_NAME)"

HDRS	= \
    svModelUtils.h \
    svModelElement.h \
    svModelElementPolyData.h \
    svModelOperation.h \
    svModel.h \
    svModelVtkMapper2D.h \
    svModelVtkMapper3D.h \
    svModelDataInteractor.h \
    svModelIO.h \
    svModelLegacyIO.h \
    svModelObjectFactory.h

ifeq ($(SV_USE_OPENCASCADE),1)
    HDRS +=  svModelElementOCCT.h
endif

ifeq ($(SV_USE_PARASOLID_QT_GUI),1)
    HDRS +=  svModelElementParasolid.h
endif

CXXSRCS	= \
    svModelUtils.cxx \
    svModelElement.cxx \
    svModelElementPolyData.cxx \
    svModelOperation.cxx \
    svModel.cxx \
    svModelVtkMapper2D.cxx \
    svModelVtkMapper3D.cxx \
    svModelDataInteractor.cxx \
    svModelIO.cxx \
    svModelLegacyIO.cxx \
    svModelObjectFactory.cxx

ifeq ($(SV_USE_OPENCASCADE),1)
    CXXSRCS += svModelElementOCCT.cxx
endif

ifeq ($(SV_USE_PARASOLID_QT_GUI),1)
    CXXSRCS += svModelElementParasolid.cxx
endif

CXXSRCS += us_init.cxx

UIFILES =

SV_APPEND_CPPMICROSERVICES_TO_DLL = 1
RCFILES = resource/Interactions/svModelInteraction.xml \
          resource/Interactions/svModelConfig.xml

QRCFILES =

CXXSRCS += $(addprefix moc_,$(HDRS:.h=.cxx))

CXXSRCS += $(addprefix ui_,$(UIFILES:.ui=.cxx))

CXXSRCS += $(addprefix rcc_,$(notdir $(QRCFILES:.qrc=.cxx)))

DLLHDRS =

DLLSRCS =

# these DLLLIBS came from Segmentation and can probably be cleaned up
# significantly!

DLLLIBS += $(PYTHON_LIB) $(VTK_LIBS) $(ITK_LIBS) $(QT_LIBS) $(MITK_LIBS)

DLLLIBS += \
          $(SVLIBFLAG)_simvascular_qtgui_module_common$(LIBLINKEXT) \
          $(SVLIBFLAG)_simvascular_qtgui_module_pathplanning$(LIBLINKEXT) \
          $(SVLIBFLAG)_simvascular_qtgui_module_segmentation$(LIBLINKEXT) \
          $(SVLIBFLAG)_simvascular_polydata_solid$(LIBLINKEXT) \
          $(SVLIBFLAG)_simvascular_solid$(LIBLINKEXT) \
          $(SVLIBFLAG)_simvascular_itk_lset$(LIBLINKEXT) \
          $(SVLIBFLAG)_simvascular_repository$(LIBLINKEXT) \
          $(SVLIBFLAG)_simvascular_geom$(LIBLINKEXT) \
          $(SVLIBFLAG)_simvascular_utils$(LIBLINKEXT) \
          $(SVLIBFLAG)_simvascular_globals$(LIBLINKEXT)

ifeq ($(SV_USE_MESHSIM_DISCRETE_MODEL_QT_GUI),1)
    DLLLIBS += $(SVLIBFLAG)_simvascular_meshsim_discrete_solid$(LIBLINKEXT)
endif
ifeq ($(SV_USE_MESHSIM_SOLID_MODEL_QT_GUI),1)
    DLLLIBS += $(SVLIBFLAG)_simvascular_meshsim_solid$(LIBLINKEXT)
endif
ifeq ($(SV_USE_PARASOLID_QT_GUI),1)
    DLLLIBS += $(SVLIBFLAG)_simvascular_parasolid_solid$(LIBLINKEXT)
endif
ifeq ($(SV_USE_OPENCASCADE),1)
    DLLLIBS += $(SVLIBFLAG)_simvascular_opencascade_solid$(LIBLINKEXT)
endif

DLLLIBS += $(PARASOLID_LIBS) $(MESHSIM_LIBS) $(OPENCASCADE_LIBS)

ifeq ($(SV_USE_VMTK),1)
	DLLLIBS += $(SVLIBFLAG)_simvascular_thirdparty_vmtk$(LIBLINKEXT)
	DLLLIBS += $(SV_MMG_LIBS)
endif

ifeq ($(SV_USE_MMG),1)
	DLLLIBS += $(SVLIBFLAG)_simvascular_mmg_mesh$(LIBLINKEXT)
endif

TARGET_LIB_NAME = simvascular_qtgui_module_model

include $(TOP)/targetlib.mk
