#!/bin/bash
# ----------------------------------------------------
# docker run -d \
#  -e TWEAKS_PLUGIN=master \
#  -e LINE_NUMBERS_PLUGIN=master \
#  -e TAGS_PLUGIN=2.1.0 \
#  -e ANNOUNCEMENTS_PLUGIN=1.3 \
#  -e DASHBOARD_PLUGIN=2.4.0 \
#  -e GITHUB_PLUGIN=2.1.0 \
#  -e HUDSON_PLUGIN=2.1.2 \
#  -e WIKI_EXTENSIONS_PLUGIN=0.6.5 \
#  -e CODE_REVIEW_PLUGIN=0.6.4 \
#  -e AGILE_PLUGIN=1_3_5-light \
#  sharaku/redmine-plugins.themes

echo "Plugin installation start."

PLUGINS_INSTALL_DIR="${INSTALL_DIR}/plugins"

# version loaded
# ファイルがない場合はデフォルトを使用する
if [ -e ${PLUGINS_INSTALL_DIR} ]; then
	if [ -e ${PLUGINS_INSTALL_DIR}/plugin.versions ]; then
		. ${PLUGINS_INSTALL_DIR}/plugin.versions
	fi
else
	mkdir -p ${PLUGINS_INSTALL_DIR}
fi


#
# Install plugin
#  バージョン指定がない場合はインストールしない。インストール済みのものは削除する
#  インストール済みのプラグインと異なるバージョンを指定された場合は再インストールする
#


# redmine tweaks plugin
if [ "${TWEAKS_PLUGIN}" = "" ]; then
	rm -rf ${PLUGINS_INSTALL_DIR}/redmine_tweaks
	echo " --> tweaks plugin did not install."
else
	if [ "${TWEAKS_PLUGIN}" != "${TWEAKS_PLUGIN_OLD}" ]; then
		rm -rf ${PLUGINS_INSTALL_DIR}/redmine_tweaks
	fi
	if [ ! -e ${PLUGINS_INSTALL_DIR}/redmine_tweaks ]; then
		mkdir -p ${PLUGINS_INSTALL_DIR}/redmine_tweaks
		wget --no-check-certificate -nv https://github.com/alexandermeindl/redmine_tweaks/archive/${TWEAKS_PLUGIN}.tar.gz -O - | tar -zvxf - --strip=1 -C ${PLUGINS_INSTALL_DIR}/redmine_tweaks
		echo " --> tweaks plugin install. version${TWEAKS_PLUGIN}"
	else
		echo " --> tweaks plugin did not update."
	fi
fi

# line numbers plugin
if [ "${LINE_NUMBERS_PLUGIN}" = "" ]; then
	rm -rf ${PLUGINS_INSTALL_DIR}/line_numbers
	echo " --> line numbers plugin did not install."
else
	if [ "${LINE_NUMBERS_PLUGIN}" != "${LINE_NUMBERS_PLUGIN_OLD}" ]; then
		rm -rf ${PLUGINS_INSTALL_DIR}/line_numbers
	fi
	if [ ! -e ${PLUGINS_INSTALL_DIR}/line_numbers ]; then
		mkdir -p ${PLUGINS_INSTALL_DIR}/line_numbers
		wget --no-check-certificate -nv https://github.com/cdwertmann/line_numbers/archive/${LINE_NUMBERS_PLUGIN}.tar.gz -O - | tar -zvxf - --strip=1 -C ${PLUGINS_INSTALL_DIR}/line_numbers
		echo " --> line numbers plugin install. version${LINE_NUMBERS_PLUGIN}"
	else
		echo " --> line numbers plugin did not update."
	fi
fi

# redmine tags plugin
if [ "${TAGS_PLUGIN}" = "" ]; then
	rm -rf ${PLUGINS_INSTALL_DIR}/redmine_tags
	echo " --> tags plugin did not install."
else
	if [ "${TAGS_PLUGIN}" != "${TAGS_PLUGIN_OLD}" ]; then
		rm -rf ${PLUGINS_INSTALL_DIR}/redmine_tags
	fi
	if [ ! -e ${PLUGINS_INSTALL_DIR}/redmine_tags ]; then
		mkdir -p ${PLUGINS_INSTALL_DIR}/redmine_tags
		wget --no-check-certificate -nv https://github.com/ixti/redmine_tags/archive/${TAGS_PLUGIN}.tar.gz -O - | tar -zvxf - --strip=1 -C ${PLUGINS_INSTALL_DIR}/redmine_tags
		echo " --> tags plugin install. version${TAGS_PLUGIN}"
	else
		echo " --> tags plugin did not update."
	fi
fi

# redmine announcements plugin
if [ "${ANNOUNCEMENTS_PLUGIN}" = "" ]; then
	rm -rf ${PLUGINS_INSTALL_DIR}/redmine_announcements
	echo " --> announcements plugin did not install."
else
	if [ "${ANNOUNCEMENTS_PLUGIN}" != "${ANNOUNCEMENTS_PLUGIN_OLD}" ]; then
		rm -rf ${PLUGINS_INSTALL_DIR}/redmine_announcements
	fi
	if [ ! -e ${PLUGINS_INSTALL_DIR}/redmine_announcements ]; then
		mkdir -p ${PLUGINS_INSTALL_DIR}/redmine_announcements
		wget --no-check-certificate -nv https://github.com/buoyant/redmine_announcements/archive/v${ANNOUNCEMENTS_PLUGIN}.tar.gz -O - | tar -zvxf - --strip=1 -C ${PLUGINS_INSTALL_DIR}/redmine_announcements
		echo " --> announcements plugin install. version${ANNOUNCEMENTS_PLUGIN}"
	else
		echo " --> announcements plugin did not update."
	fi
fi

# redmine dashboard tasks
if [ "${DASHBOARD_PLUGIN}" = "" ]; then
	rm -rf ${PLUGINS_INSTALL_DIR}/redmine_dashboard
	echo " --> dashboard plugin did not install."
else
	if [ "${DASHBOARD_PLUGIN}" != "${DASHBOARD_PLUGIN_OLD}" ]; then
		rm -rf ${PLUGINS_INSTALL_DIR}/redmine_dashboard
	fi
	if [ ! -e ${PLUGINS_INSTALL_DIR}/redmine_dashboard ]; then
		mkdir -p ${PLUGINS_INSTALL_DIR}/redmine_dashboard
		wget --no-check-certificate -nv https://github.com/jgraichen/redmine_dashboard/archive/v${DASHBOARD_PLUGIN}.tar.gz -O - | tar -zvxf - --strip=1 -C ${PLUGINS_INSTALL_DIR}/redmine_dashboard
		sed "s/gem 'rake'/# gem 'rake'/" -i ${PLUGINS_INSTALL_DIR}/redmine_dashboard/Gemfile
		echo 'gem "guard-rspec"' >> ${PLUGINS_INSTALL_DIR}/redmine_dashboard/Gemfile

		echo " --> dashboard plugin install. version${DASHBOARD_PLUGIN}"
	else
		echo " --> dashboard plugin did not update."
	fi
fi

# Redmine github plugin
if [ "${GITHUB_PLUGIN}" = "" ]; then
	rm -rf ${PLUGINS_INSTALL_DIR}/redmine_github_hook
	echo " --> github plugin did not install."
else
	if [ "${GITHUB_PLUGIN}" != "${GITHUB_PLUGIN_OLD}" ]; then
		rm -rf ${PLUGINS_INSTALL_DIR}/redmine_github_hook
	fi
	if [ ! -e ${PLUGINS_INSTALL_DIR}/redmine_github_hook ]; then
		mkdir -p ${PLUGINS_INSTALL_DIR}/redmine_github_hook
		wget --no-check-certificate -nv https://github.com/koppen/redmine_github_hook/archive/v${GITHUB_PLUGIN}.tar.gz -O - | tar -zvxf - --strip=1 -C ${PLUGINS_INSTALL_DIR}/redmine_github_hook
		echo " --> github plugin install. version${GITHUB_PLUGIN}"
	else
		echo " --> github plugin did not update."
	fi
fi

# Redmine hudson plugin
if [ "${HUDSON_PLUGIN}" = "" ]; then
	rm -rf ${PLUGINS_INSTALL_DIR}/redmine_hudson
	echo " --> hudson plugin did not install."
else
	if [ "${HUDSON_PLUGIN}" != "${HUDSON_PLUGIN_OLD}" ]; then
		rm -rf ${PLUGINS_INSTALL_DIR}/redmine_hudson
	fi
	if [ ! -e ${PLUGINS_INSTALL_DIR}/redmine_hudson ]; then
		mkdir -p ${PLUGINS_INSTALL_DIR}/redmine_hudson
		wget --no-check-certificate -nv https://bitbucket.org/nobiinu_and/redmine_hudson/get/${HUDSON_PLUGIN}.tar.gz -O - | tar -zvxf - --strip=1 -C ${PLUGINS_INSTALL_DIR}/redmine_hudson
		echo " --> hudson plugin install. version${HUDSON_PLUGIN}"
	else
		echo " --> hudson plugin did not update."
	fi
fi

# redmine_wiki_extensions
if [ "${WIKI_EXTENSIONS_PLUGIN}" = "" ]; then
	rm -rf ${PLUGINS_INSTALL_DIR}/redmine_wiki_extensions
	echo " --> wiki extensions plugin did not install."
else
	if [ "${WIKI_EXTENSIONS_PLUGIN}" != "${WIKI_EXTENSIONS_PLUGIN_OLD}" ]; then
		rm -rf ${PLUGINS_INSTALL_DIR}/redmine_wiki_extensions
	fi
	if [ ! -e ${PLUGINS_INSTALL_DIR}/redmine_wiki_extensions ]; then
		mkdir -p ${PLUGINS_INSTALL_DIR}/redmine_wiki_extensions
		wget --no-check-certificate -nv https://bitbucket.org/haru_iida/redmine_wiki_extensions/get/${WIKI_EXTENSIONS_PLUGIN}.tar.gz -O - | tar -zvxf - --strip=1 -C ${PLUGINS_INSTALL_DIR}/redmine_wiki_extensions
		echo " --> wiki extensions plugin install. version${WIKI_EXTENSIONS_PLUGIN}"
	else
		echo " --> wiki extensions plugin did not update."
	fi
fi

# redmine code review plugin
if [ "${CODE_REVIEW_PLUGIN}" = "" ]; then
	rm -rf ${PLUGINS_INSTALL_DIR}/redmine_code_review
	echo " --> code review plugin did not install."
else
	if [ "${CODE_REVIEW_PLUGIN}" != "${CODE_REVIEW_PLUGIN_OLD}" ]; then
		rm -rf ${PLUGINS_INSTALL_DIR}/redmine_code_review
	fi
	if [ ! -e ${PLUGINS_INSTALL_DIR}/redmine_code_review ]; then
		wget --no-check-certificate https://bitbucket.org/haru_iida/redmine_code_review/downloads/redmine_code_review-${CODE_REVIEW_PLUGIN}.zip -P /tmp/
		unzip /tmp/redmine_code_review-${CODE_REVIEW_PLUGIN}.zip -d ${PLUGINS_INSTALL_DIR}/
		rm -rf /tmp/redmine_code_review-${CODE_REVIEW_PLUGIN}.zip
		echo " --> code review plugin install. version${CODE_REVIEW_PLUGIN}"
	else
		echo " --> code review plugin did not update."
	fi
fi

# redmine agile plugin
if [ "${AGILE_PLUGIN}" = "" ]; then
	rm -rf ${PLUGINS_INSTALL_DIR}/redmine_agile
	echo " --> agile plugin did not install."
else
	if [ "${AGILE_PLUGIN}" != "${AGILE_PLUGIN_OLD}" ]; then
		rm -rf ${PLUGINS_INSTALL_DIR}/redmine_agile
	fi
	if [ ! -e ${PLUGINS_INSTALL_DIR}/redmine_agile ]; then
		wget --no-check-certificate http://redminecrm.com/license_manager/15337/redmine_agile-${AGILE_PLUGIN}.zip -P /tmp/
		unzip /tmp/redmine_agile-${AGILE_PLUGIN}.zip -d ${PLUGINS_INSTALL_DIR}/
		rm -rf /tmp/redmine_agile-${AGILE_PLUGIN}.zip
		echo " --> agile plugin install. version${AGILE_PLUGIN}"
	else
		echo " --> agile plugin did not update."
	fi
fi

# version saveed
echo "#/bin/sh"                                                     >  ${PLUGINS_INSTALL_DIR}/plugin.versions
echo "export TWEAKS_PLUGIN_OLD=${TWEAKS_PLUGIN}"                    >> ${PLUGINS_INSTALL_DIR}/plugin.versions
echo "export LINE_NUMBERS_PLUGIN_OLD=${LINE_NUMBERS_PLUGIN}"        >> ${PLUGINS_INSTALL_DIR}/plugin.versions
echo "export TAGS_PLUGIN_OLD=${TAGS_PLUGIN}"                        >> ${PLUGINS_INSTALL_DIR}/plugin.versions
echo "export ANNOUNCEMENTS_PLUGIN_OLD=${ANNOUNCEMENTS_PLUGIN}"      >> ${PLUGINS_INSTALL_DIR}/plugin.versions
echo "export DASHBOARD_PLUGIN_OLD=${DASHBOARD_PLUGIN}"              >> ${PLUGINS_INSTALL_DIR}/plugin.versions
echo "export GITHUB_PLUGIN_OLD=${GITHUB_PLUGIN}"                    >> ${PLUGINS_INSTALL_DIR}/plugin.versions
echo "export HUDSON_PLUGIN_OLD=${HUDSON_PLUGIN}"                    >> ${PLUGINS_INSTALL_DIR}/plugin.versions
echo "export WIKI_EXTENSIONS_PLUGIN_OLD=${WIKI_EXTENSIONS_PLUGIN}"  >> ${PLUGINS_INSTALL_DIR}/plugin.versions
echo "export CODE_REVIEW_PLUGIN_OLD=${CODE_REVIEW_PLUGIN}"          >> ${PLUGINS_INSTALL_DIR}/plugin.versions
echo "export AGILE_PLUGIN_OLD=${AGILE_PLUGIN}"                      >> ${PLUGINS_INSTALL_DIR}/plugin.versions

echo "Plugin installation completed."

