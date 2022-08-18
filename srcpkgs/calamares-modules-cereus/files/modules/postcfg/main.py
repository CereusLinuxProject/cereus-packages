#!/usr/bin/python3
# -*- coding: utf-8 -*-
#
# === This file is part of Calamares - <http://github.com/calamares> ===
#
#   Copyright 2014 - 2019, Philip Müller <philm@manjaro.org>
#   Copyright 2016, Artoo <artoo@manjaro.org>
#
#   Calamares is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   Calamares is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with Calamares. If not, see <http://www.gnu.org/licenses/>.

import libcalamares
import subprocess

from shutil import copy2
from distutils.dir_util import copy_tree
from os.path import join, exists
from libcalamares.utils import target_env_call


class ConfigController:
    def __init__(self):
        self.__root = libcalamares.globalstorage.value("rootMountPoint")

    @property
    def root(self):
        return self.__root

    def terminate(self, proc):
        target_env_call(['killall', '-9', proc])

    def copy_file(self, file):
        if exists("/" + file):
            copy2("/" + file, join(self.root, file))

    def copy_folder(self, source, target):
        if exists("/" + source):
            copy_tree("/" + source, join(self.root, target))

    def remove_pkg(self, pkg):
            target_env_call(['xbps-remove', '-Ry', pkg])

    def umount(self, mp):
        subprocess.call(["umount", "-l", join(self.root, mp)])

    def mount(self, mp):
        subprocess.call(["mount", "-B", "/" + mp, join(self.root, mp)])

    def rmdir(self, dir):
        subprocess.call(["rm", "-Rf", join(self.root, dir)])

    def mkdir(self, dir):
        subprocess.call(["mkdir", "-p", join(self.root, dir)])

    def run(self):
        if exists(join(self.root, "usr/sbin/void-installer")):
            target_env_call(["rm", "-f", "usr/sbin/void-installer"])

        if exists(join(self.root, "usr/bin/startplasma-x11")):
            print("Not removing Breeze")
        else:
            self.remove_pkg("breeze")

        # Initialize package manager databases
        if libcalamares.globalstorage.value("hasInternet"):
            target_env_call(["xbps-install", "-Syy"])

        # Remove calamares
        self.remove_pkg("calamares-cereus")
        if exists(join(self.root, "usr/share/applications/calamares.desktop")):
            target_env_call(["rm", "-f", "usr/share/applications/calamares.desktop"])

        # Copy skel to root
        self.copy_folder('etc/skel', 'root')

        # Update grub.cfg
        if exists(join(self.root, "usr/bin/update-grub")):
            target_env_call(["update-grub"])

        # Enable 'menu_auto_hide' when supported in grubenv
        if exists(join(self.root, "usr/bin/grub-set-bootflag")):
            target_env_call(["grub-editenv", "-", "set", "menu_auto_hide=1", "boot_success=1"])

        # Enable plymouth
        target_env_call(["plymouth-set-default-theme", "-R", "cereus_simply"])

def run():
    """ Misc postinstall configurations """

    config = ConfigController()

    return config.run()
