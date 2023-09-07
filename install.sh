SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=true
LATESTARTSERVICE=true

print_modname() {
  ui_print "*************************************"
  ui_print " GPU Turbo Boost v6.2.2 Fork         "
  ui_print " Magisk installer                    "
  ui_print " By: EmperorEye1993 @ xda-developers "
  ui_print " Modded By: JosFlix7                 "
  ui_print "*************************************"
}

on_install() {
  ui_print "- GPU Turbo Boost Activated!"
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
}
