project('gst-rga_convert', 'c',
  version : '0.1.0',
  default_options : [ 'warning_level=1',
                      'buildtype=debugoptimized' ])

core_conf = configuration_data()
core_conf.set('PACKAGE', '"@0@"'.format(meson.project_name()))
core_conf.set('VERSION', '"@0@"'.format(meson.project_version()))

configure_file(output : 'config.h', configuration : core_conf)

configinc = include_directories('.')

common_args = ['-DHAVE_CONFIG_H']

gst_req = '>= 1.0.0'

# Check for the required version of GStreamer core (and gst-plugins-base)
#
# If you need libraries from gst-plugins-base here, also add:
# for libgstaudio-1.0: gstreamer-audio-1.0
# for libgstvideo-1.0: gstreamer-video-1.0
# for libgsttag-1.0: gstreamer-tag-1.0
# for libgstpbutils-1.0: gstreamer-pbutils-1.0
# for libgstfft-1.0: gstreamer-fft-1.0
# for libgstinterfaces-1.0: gstreamer-interfaces-1.0
# for libgstrtp-1.0: gstreamer-rtp-1.0
# for libgstrtsp-1.0: gstreamer-rtsp-1.0
# etc.
gst_dep = dependency('gstreamer-1.0', version : gst_req,
  fallback : ['gstreamer', 'gst_dep'])
gst_base_dep = dependency('gstreamer-base-1.0', version : gst_req,
  fallback : ['gstreamer', 'gst_base_dep'])

# Set the directory where plugins should be installed.
#
# If the prefix is the user home directory, adjust the plugin installation
# path so that GStreamer can find it. Requires meson >= 0.53.0
fs = import('fs')
if fs.is_samepath(get_option('prefix'), '~')
  plugins_install_dir = '@0@/.local/share/gstreamer-1.0/plugins'.format(get_option('prefix'))
else
  plugins_install_dir = '@0@/gstreamer-1.0'.format(get_option('libdir'))
endif
librga_dep = dependency('librga')
libvideo_dep = dependency('gstreamer-video-1.0')
libgstallocators_dep = dependency('gstreamer-allocators-1.0')
plugin_deps = [gst_dep, gst_base_dep, librga_dep, libgstallocators_dep, libvideo_dep]
tool_deps = [gst_dep]

subdir('plugins')
