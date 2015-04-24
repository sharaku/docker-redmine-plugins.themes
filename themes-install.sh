#!/bin/bash
# ----------------------------------------------------
# docker run -d \
#  -e FARNED_FANCY_THEME=master \
#  -e A1_THEME=1_1_2 \
#  -e COFFEE_THEME=0_0_4 \
#  -e REDMINECRM_THEME=0_0_2 \
#  -e HIGHRISE_THEME=1_1_2 \
#  -e CIRCLE_THEME=1_0_1 \
#  -e GITMIKE_THEME=r7 \
#  sharaku/redmine-plugins.themes

echo "Themes installation start."

THEMES_INSTALL_DIR="${INSTALL_DIR}/themes"

# version loaded
# ファイルがない場合はデフォルトを使用する
if [ -e ${THEMES_INSTALL_DIR} ]; then
	if [ -e ${THEMES_INSTALL_DIR}/themes.versions ]; then
		. ${THEMES_INSTALL_DIR}/themes.versions
	fi
else
	mkdir -p ${THEMES_INSTALL_DIR}
fi


#
# Install themes
#  バージョン指定がない場合はインストールしない。インストール済みのものは削除する
#  インストール済みのテーマと異なるバージョンを指定された場合は再インストールする
#

# https://github.com/farend/redmine_theme_farend_fancy/
if [ "${FARNED_FANCY_THEME}" = "" ]; then
	rm -rf ${THEMES_INSTALL_DIR}/farend_fancy
	echo " --> farend fancy theme did not install."
else
	if [ "${FARNED_FANCY_THEME}" != "${FARNED_FANCY_THEME_OLD}" ]; then
		rm -rf ${THEMES_INSTALL_DIR}/farend_fancy
	fi
	if [ ! -e ${THEMES_INSTALL_DIR}/farend_fancy ]; then
		wget --no-check-certificate https://github.com/farend/redmine_theme_farend_fancy/archive/${FARNED_FANCY_THEME}.zip -P /tmp/
		unzip /tmp/${FARNED_FANCY_THEME}.zip -d ${THEMES_INSTALL_DIR}/
		mv ${THEMES_INSTALL_DIR}/redmine_theme_farend_fancy-master ${THEMES_INSTALL_DIR}/farend_fancy
		rm -rf /tmp/${FARNED_FANCY_THEME}.zip
		echo " --> farend fancy theme install. version${FARNED_FANCY_THEME}"
	else
		echo " --> farend fancy theme did not update."
	fi
fi

# http://redminecrm.com/pages/a1-theme
if [ "${A1_THEME}" = "" ]; then
	rm -rf ${THEMES_INSTALL_DIR}/a1
	echo " --> a1 theme did not install."
else
	if [ "${A1_THEME}" != "${A1_THEME_OLD}" ]; then
		rm -rf ${THEMES_INSTALL_DIR}/a1
	fi
	if [ ! -e ${THEMES_INSTALL_DIR}/a1 ]; then
		wget --no-check-certificate  http://redminecrm.com/license_manager/7644/a1-${A1_THEME}.zip -P /tmp/
		unzip /tmp/a1-${A1_THEME}.zip -d ${THEMES_INSTALL_DIR}/
		rm -rf /tmp/a1-${A1_THEME}.zip
		echo " --> a1 theme install. version${A1_THEME}"
	else
		echo " --> a1 theme did not update."
	fi
fi

# http://www.redminecrm.com/pages/coffee-theme
if [ "${COFFEE_THEME}" = "" ]; then
	rm -rf ${THEMES_INSTALL_DIR}/coffee
	echo " --> coffee theme did not install."
else
	if [ "${COFFEE_THEME}" != "${COFFEE_THEME_OLD}" ]; then
		rm -rf ${THEMES_INSTALL_DIR}/coffee
	fi
	if [ ! -e ${THEMES_INSTALL_DIR}/coffee ]; then
		wget --no-check-certificate http://www.redminecrm.com/license_manager/4508/coffee-${COFFEE_THEME}.zip -P /tmp/
		unzip /tmp/coffee-${COFFEE_THEME}.zip -d ${THEMES_INSTALL_DIR}/
		rm -rf /tmp/coffee-${COFFEE_THEME}.zip
		echo " --> coffee theme install. version${COFFEE_THEME}"
	else
		echo " --> coffee theme did not update."
	fi
fi

# http://www.redminecrm.com/pages/redminecrm-theme
if [ "${REDMINECRM_THEME}" = "" ]; then
	rm -rf ${THEMES_INSTALL_DIR}/redminecrm
	echo " --> redminecrm theme did not install."
else
	if [ "${REDMINECRM_THEME}" != "${REDMINECRM_THEME_OLD}" ]; then
		rm -rf ${THEMES_INSTALL_DIR}/redminecrm
	fi
	if [ ! -e ${THEMES_INSTALL_DIR}/redminecrm ]; then
		wget --no-check-certificate http://www.redminecrm.com/license_manager/3834/redminecrm-${REDMINECRM_THEME}.zip -P /tmp/
		unzip /tmp/redminecrm-${REDMINECRM_THEME}.zip -d ${THEMES_INSTALL_DIR}/
		rm -rf /tmp/redminecrm-${REDMINECRM_THEME}.zip
		echo " --> redminecrm theme install. version${REDMINECRM_THEME}"
	else
		echo " --> redminecrm theme did not update."
	fi
fi

# http://redminecrm.com/pages/highrise-theme
if [ "${HIGHRISE_THEME}" = "" ]; then
	rm -rf ${THEMES_INSTALL_DIR}/highrise
	echo " --> highrise theme did not install."
else
	if [ "${HIGHRISE_THEME}" != "${HIGHRISE_THEME_OLD}" ]; then
		rm -rf ${THEMES_INSTALL_DIR}/highrise
	fi
	if [ ! -e ${THEMES_INSTALL_DIR}/highrise ]; then
		wget --no-check-certificate http://redminecrm.com/license_manager/7646/highrise-${HIGHRISE_THEME}.zip -P /tmp/
		unzip /tmp/highrise-${HIGHRISE_THEME}.zip -d ${THEMES_INSTALL_DIR}/
		rm -rf /tmp/highrise-${HIGHRISE_THEME}.zip
		echo " --> highrise theme install. version${HIGHRISE_THEME}"
	else
		echo " --> highrise theme did not update."
	fi
fi

# http://www.redminecrm.com/pages/circle-theme
if [ "${CIRCLE_THEME}" = "" ]; then
	rm -rf ${THEMES_INSTALL_DIR}/circle
	echo " --> circle theme did not install."
else
	if [ "${CIRCLE_THEME}" != "${CIRCLE_THEME_OLD}" ]; then
		rm -rf ${THEMES_INSTALL_DIR}/circle
	fi
	if [ ! -e ${THEMES_INSTALL_DIR}/circle ]; then
		wget --no-check-certificate http://www.redminecrm.com/license_manager/11619/circle_theme-${CIRCLE_THEME}.zip -P /tmp/
		unzip /tmp/circle_theme-${CIRCLE_THEME}.zip -d ${THEMES_INSTALL_DIR}/
		rm -rf /tmp/circle_theme-${CIRCLE_THEME}.zip
		echo " --> circle theme install. version${CIRCLE_THEME}"
	else
		echo " --> circle theme did not update."
	fi
fi

# https://github.com/makotokw/redmine-theme-gitmike
if [ "${GITMIKE_THEME}" = "" ]; then
	rm -rf ${THEMES_INSTALL_DIR}/gitmike
	echo " --> gitmike theme did not install."
else
	if [ "${GITMIKE_THEME}" != "${GITMIKE_THEME_OLD}" ]; then
		rm -rf ${THEMES_INSTALL_DIR}/gitmike
	fi
	if [ ! -e ${THEMES_INSTALL_DIR}/gitmike ]; then
		mkdir -p ${THEMES_INSTALL_DIR}/gitmike
		wget --no-check-certificate -nv https://github.com/makotokw/redmine-theme-gitmike/archive/${GITMIKE_THEME}.tar.gz -O - | tar -zvxf - --strip=1 -C ${THEMES_INSTALL_DIR}/gitmike
		echo " --> gitmike theme install. version${GITMIKE_THEME}"
	else
		echo " --> gitmike theme did not update."
	fi
fi

# version saveed
echo "#/bin/sh"                                                >  ${THEMES_INSTALL_DIR}/themes.versions
echo "export FARNED_FANCY_THEME_OLD=${FARNED_FANCY_THEME}"     >> ${THEMES_INSTALL_DIR}/themes.versions
echo "export A1_THEME_OLD=${A1_THEME}"                         >> ${THEMES_INSTALL_DIR}/themes.versions
echo "export COFFEE_THEME_OLD=${COFFEE_THEME}"                 >> ${THEMES_INSTALL_DIR}/themes.versions
echo "export REDMINECRM_THEME_OLD=${REDMINECRM_THEME}"         >> ${THEMES_INSTALL_DIR}/themes.versions
echo "export HIGHRISE_THEME_OLD=${HIGHRISE_THEME}"             >> ${THEMES_INSTALL_DIR}/themes.versions
echo "export CIRCLE_THEME_OLD=${CIRCLE_THEME}"                 >> ${THEMES_INSTALL_DIR}/themes.versions
echo "export GITMIKE_THEME_OLD=${GITMIKE_THEME}"               >> ${THEMES_INSTALL_DIR}/themes.versions

echo "Themes installation completed."
