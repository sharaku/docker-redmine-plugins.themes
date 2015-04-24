docker-redmine-plugins.themes
=============================

# はじめに
redmineのプラグインをインストールするコンテナです。  
指定したプラグインをDLし、展開します。  

主に、sameersbn/redmineと組み合わせて使用することを想定しています。  
また、デフォルトではコンテナ内のファイルはホスト側からは隔離されます。永続的なファイルの保存が必要な場合は-vオプションを使用してホスト側のディレクトリを以下へマウントしてください。

注意：  
redmineの起動はこのコンテナがプラグイン、テーマのインストールを完了してから行ってください。  

使い方
------
# Installation
以下のようにdocker imageをpullします。

    docker pull sharaku/redmine-plugins.themes

Docker imageを自分で構築することもできます。

    git clone https://github.com/sharaku/docker-redmine-plugins.themes.git
    cd docker-redmine-plugins.themes
    docker build --tag="$USER/redmine-plugins.themes" .

# Quick Start
redmine-plugins.themesとredmineのimageを実行します。

    docker run -it \
      --name redmine-vol \
      -v /path/to/redmine/data:/home/redmine/data:rw \
      -e TWEAKS_PLUGIN=master \
      -e LINE_NUMBERS_PLUGIN=master \
      -e TAGS_PLUGIN=2.1.0 \
      -e ANNOUNCEMENTS_PLUGIN=1.3 \
      -e DASHBOARD_PLUGIN=2.4.0 \
      -e GITHUB_PLUGIN=2.1.0 \
      -e HUDSON_PLUGIN=2.1.2 \
      -e WIKI_EXTENSIONS_PLUGIN=0.6.5 \
      -e CODE_REVIEW_PLUGIN=0.6.4 \
      -e AGILE_PLUGIN=1_3_5-light \
      -e FARNED_FANCY_THEME=master \
      -e A1_THEME=1_1_2 \
      -e COFFEE_THEME=0_0_4 \
      -e REDMINECRM_THEME=0_0_2 \
      -e HIGHRISE_THEME=1_1_2 \
      -e CIRCLE_THEME=1_0_1 \
      -e GITMIKE_THEME=r7 \
      sharaku/redmine-plugins.themes
    docker run -d \
      --name redmine-mysql \
      -v /path/to/redmine/mysql:/var/lib/mysql:rw \
      -e 'DB_NAME=redmine_production' -e 'DB_USER=redmine' -e 'DB_PASS=password'\
      sameersbn/mysql:latest
    docker run -d \
      --name redmine \
      --link redmine-mysql:mysql \
      --volumes-from redmine-vol \
      -p 8080:80 \
      sameersbn/redmine:2.6.0-1

# インストールディレクトリの変更
デフォルトでは、以下にインストールされます。

+    /home/redmine/data/plugins
+    /home/redmine/data/themes

変更するには、以下のオプションを指定します。

     -e INSTALL_DIR=/path/to/ 

# インストール＆アンインストール＆アップデート
プラグイン, テーマをインストールするには-eオプションでバージョンを指定します。  
-eオプションを指定しない場合、そのプラグイン, テーマはアンインストール(ディレクトリ削除)されます。  
前回指定した-eと異なるバージョンを指定した場合、そのプラグイン, テーマは再インストールされます。

# プラグイン
このコンテナは以下のプラグインをインストールすることが可能です。

## tweaks
https://github.com/alexandermeindl/redmine_tweaks

+   `-e TWEAKS_PLUGIN=master` : プラグインをインストールします。省略するとインストールされません。

## line numbers
https://github.com/cdwertmann/line_numbers

+   `-e LINE_NUMBERS_PLUGIN=master` : プラグインをインストールします。省略するとインストールされません。

## tags plugin
https://github.com/ixti/redmine_tags

+   `-e TAGS_PLUGIN=2.1.0` : プラグインをインストールします。省略するとインストールされません。  
インストールするバージョンは`2.1.0`のように指定します。

## announcements
https://github.com/buoyant/redmine_announcements

+   `-e ANNOUNCEMENTS_PLUGIN=1.3` : プラグインをインストールします。省略するとインストールされません。  
インストールするバージョンは`1.3`のように指定します。

## dashboard tasks
https://github.com/jgraichen/redmine_dashboard

+   `-e DASHBOARD_PLUGIN=2.4.0` : プラグインをインストールします。省略するとインストールされません。  
インストールするバージョンは`2.4.0`のように指定します。

## github
https://github.com/koppen/redmine_github_hook

+   `-e GITHUB_PLUGIN=2.1.0` : プラグインをインストールします。省略するとインストールされません。  
インストールするバージョンは`2.1.0`のように指定します。

## hudson
https://bitbucket.org/nobiinu_and/redmine_hudson

+   `-e HUDSON_PLUGIN=2.1.2` : プラグインをインストールします。省略するとインストールされません。  
インストールするバージョンは`2.1.2`のように指定します。

## wiki extensions
https://bitbucket.org/haru_iida/redmine_wiki_extensions

+   `-e WIKI_EXTENSIONS_PLUGIN=0.6.5` : プラグインをインストールします。省略するとインストールされません。  
インストールするバージョンは`0.6.5`のように指定します。

## code review
https://bitbucket.org/haru_iida/redmine_code_review

+   `-e CODE_REVIEW_PLUGIN=0.6.4` : プラグインをインストールします。省略するとインストールされません。  
インストールするバージョンは`0.6.4`のように指定します。

## redmine agile
http://redminecrm.com/projects/agile/pages/1

+   `-e AGILE_PLUGIN=1_3_5-light` : プラグインをインストールします。省略するとインストールされません。  
インストールするバージョンは`1_3_5-light`のように指定します。

# テーマ
このコンテナは以下のテーマをインストールすることが可能です。

## farend fancy
https://github.com/farend/redmine_theme_farend_fancy/

+   `-e FARNED_FANCY_THEME=master` : プラグインをインストールします。省略するとインストールされません。  

## a1
http://redminecrm.com/pages/a1-theme

+   `-e A1_THEME=1_1_2` : プラグインをインストールします。省略するとインストールされません。  
インストールするバージョンは`1_1_2`のように指定します。

## coffee
http://www.redminecrm.com/pages/coffee-theme

+   `-e COFFEE_THEME=0_0_2` : プラグインをインストールします。省略するとインストールされません。  
インストールするバージョンは`0_0_2`のように指定します。

## redminecrm
http://www.redminecrm.com/pages/redminecrm-theme

+   `-e REDMINECRM_THEME=0_0_4` : プラグインをインストールします。省略するとインストールされません。  
インストールするバージョンは`0_0_4`のように指定します。

## highrise
http://redminecrm.com/pages/highrise-theme

+   `-e HIGHRISE_THEME=1_1_2` : プラグインをインストールします。省略するとインストールされません。  
インストールするバージョンは`1_1_2`のように指定します。

## circle
http://www.redminecrm.com/pages/circle-theme

+   `-e CIRCLE_THEME=1_0_1` : プラグインをインストールします。省略するとインストールされません。  
インストールするバージョンは`1_0_1`のように指定します。

## gitmike
https://github.com/makotokw/redmine-theme-gitmike

+   `-e GITMIKE_THEME=r7` : プラグインをインストールします。省略するとインストールされません。  
インストールするバージョンは`r7`のように指定します。

