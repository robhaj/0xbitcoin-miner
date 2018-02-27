# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := gpuminer_addon
### Generated for rule binding_gyp_gpuminer_addon_target_cuda_on_linux:
$(obj).$(TOOLSET)/$(TARGET)/geni/keccak256.o: obj := $(abs_obj)
$(obj).$(TOOLSET)/$(TARGET)/geni/keccak256.o: builddir := $(abs_builddir)
$(obj).$(TOOLSET)/$(TARGET)/geni/keccak256.o: TOOLSET := $(TOOLSET)
$(obj).$(TOOLSET)/$(TARGET)/geni/keccak256.o: $(srcdir)/cpp/keccak256.cu $(abspath\ $<)
	$(call do_cmd,binding_gyp_gpuminer_addon_target_cuda_on_linux_0)

all_deps += $(obj).$(TOOLSET)/$(TARGET)/geni/keccak256.o
cmd_binding_gyp_gpuminer_addon_target_cuda_on_linux_0 = LD_LIBRARY_PATH=$(builddir)/lib.host:$(builddir)/lib.target:$$LD_LIBRARY_PATH; export LD_LIBRARY_PATH; cd $(srcdir)/.; mkdir -p $(obj).$(TOOLSET)/gpuminer_addon/geni; nvcc -Xcompiler -fpic -c -o "$(obj).$(TOOLSET)/gpuminer_addon/geni/keccak256.o" "$(abspath $<)"
quiet_cmd_binding_gyp_gpuminer_addon_target_cuda_on_linux_0 = RULE binding_gyp_gpuminer_addon_target_cuda_on_linux_0 $@

rule_binding_gyp_gpuminer_addon_target_cuda_on_linux_outputs := \
	$(obj).$(TOOLSET)/$(TARGET)/geni/keccak256.o

### Finished generating for rule: binding_gyp_gpuminer_addon_target_cuda_on_linux

### Finished generating for all rules

DEFS_Debug := \
	'-DNODE_GYP_MODULE_NAME=gpuminer_addon' \
	'-DUSING_UV_SHARED=1' \
	'-DUSING_V8_SHARED=1' \
	'-DV8_DEPRECATION_WARNINGS=1' \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DBUILDING_NODE_EXTENSION' \
	'-DDEBUG' \
	'-D_DEBUG' \
	'-DV8_ENABLE_CHECKS'

# Flags passed to all source files.
CFLAGS_Debug := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-g \
	-O0

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++0x

INCS_Debug := \
	-I/home/ubuntu/.node-gyp/8.9.4/include/node \
	-I/home/ubuntu/.node-gyp/8.9.4/src \
	-I/home/ubuntu/.node-gyp/8.9.4/deps/uv/include \
	-I/home/ubuntu/.node-gyp/8.9.4/deps/v8/include \
	-I/usr/local/include \
	-I/usr/local/cuda/include

DEFS_Release := \
	'-DNODE_GYP_MODULE_NAME=gpuminer_addon' \
	'-DUSING_UV_SHARED=1' \
	'-DUSING_V8_SHARED=1' \
	'-DV8_DEPRECATION_WARNINGS=1' \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DBUILDING_NODE_EXTENSION'

# Flags passed to all source files.
CFLAGS_Release := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-O3 \
	-fno-omit-frame-pointer

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++0x

INCS_Release := \
	-I/home/ubuntu/.node-gyp/8.9.4/include/node \
	-I/home/ubuntu/.node-gyp/8.9.4/src \
	-I/home/ubuntu/.node-gyp/8.9.4/deps/uv/include \
	-I/home/ubuntu/.node-gyp/8.9.4/deps/v8/include \
	-I/usr/local/include \
	-I/usr/local/cuda/include

OBJS := \
	$(obj).target/$(TARGET)/cpp/gpumineralpha.o \
	$(obj).target/$(TARGET)/cpp/sph/kecack.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# Make sure our actions/rules run before any of us.
$(OBJS): | $(rule_binding_gyp_gpuminer_addon_target_cuda_on_linux_outputs)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.c FORCE_DO_CMD
	@$(call do_cmd,cc,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.c FORCE_DO_CMD
	@$(call do_cmd,cc,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.c FORCE_DO_CMD
	@$(call do_cmd,cc,1)

# End of this set of suffix rules
### Rules for final target.
# Build our special outputs first.
$(obj).target/gpuminer_addon.node: | $(rule_binding_gyp_gpuminer_addon_target_cuda_on_linux_outputs)

# Preserve order dependency of special output on deps.
$(rule_binding_gyp_gpuminer_addon_target_cuda_on_linux_outputs): | 

LDFLAGS_Debug := \
	-pthread \
	-rdynamic \
	-m64 \
	-L/usr/local/lib \
	-L/usr/local/cuda/lib64

LDFLAGS_Release := \
	-pthread \
	-rdynamic \
	-m64 \
	-L/usr/local/lib \
	-L/usr/local/cuda/lib64

LIBS := \
	-lcuda \
	-lcudart

$(obj).target/gpuminer_addon.node: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/gpuminer_addon.node: LIBS := $(LIBS)
$(obj).target/gpuminer_addon.node: TOOLSET := $(TOOLSET)
$(obj).target/gpuminer_addon.node: $(OBJS) $(obj).$(TOOLSET)/$(TARGET)/geni/keccak256.o FORCE_DO_CMD
	$(call do_cmd,solink_module)

all_deps += $(obj).target/gpuminer_addon.node
# Add target alias
.PHONY: gpuminer_addon
gpuminer_addon: $(builddir)/gpuminer_addon.node

# Copy this to the executable output path.
$(builddir)/gpuminer_addon.node: TOOLSET := $(TOOLSET)
$(builddir)/gpuminer_addon.node: $(obj).target/gpuminer_addon.node FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/gpuminer_addon.node
# Short alias for building this executable.
.PHONY: gpuminer_addon.node
gpuminer_addon.node: $(obj).target/gpuminer_addon.node $(builddir)/gpuminer_addon.node

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/gpuminer_addon.node
