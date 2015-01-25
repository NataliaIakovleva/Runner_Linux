#!/bin/sh
# ========================================thub_account_name]
GITHUB_ACCOUNT=https://github.com/NataliaIakovleva
WS_DIR=Workspace_homework_36
REPO_NAME=Title_Validation_CSV
APP_VERSION=1.1
MAIN_CLASS=core.QA.Selenium
APP_NAME=QA
#ARGS_01=
# ========================================
# ========================================
# GITHUB_ACCOUNT=$1
# WS_DIR=$2
# REPO_NAME=$3
# APP_VERSION=$4
# MAIN_CLASS=$5
# ARGS_01=$6
# ========================================
 
# if ! which java >/dev/null 2>&1 ; then echo Java not installed; return; fi
# if ! which mvn >/dev/null 2>&1 ; then echo Maven not installed; return; fi
# if ! which git >/dev/null 2>&1 ; then echo Git not installed; return; fi
 
if which java >/dev/null 2>&1 ; 
  then java -version &>jv.txt;
  grep "java version" jv.txt | awk '{print $1,$3}'; 
 else 
  echo Install Java; 
  sudo apt-get install default-jdk -S ;
fi

if 
  which mvn >/dev/null 2>&1 ;
  then mvn --version &>mv.txt; 
  grep "Apache Maven" mv.txt | awk '{print $2,$3}'; 
else 
  echo Install Maven; 
  sudo apt-get install maven;
fi

if which git >/dev/null 2>&1 ; 
  then git --version &>gv.txt; 
  grep "git version" gv.txt | awk '{print $1,$3}'; 
  else echo Git not instlled; 
  sudo apt-get install git;
fi
 
if [ -d "$HOME/$WS_DIR" ] ; 
  then cd ~/$WS_DIR; 
else 
  echo Create $WS_DIR directory; 
  mkdir $WS_DIR;
  cd ~/$WS_DIR;
fi
 
if 
  [ -d "$HOME/$WS_DIR/$REPO_NAME" ]; 
  then rm -rf $HOME/$WS_DIR/$REPO_NAME; 
fi

git clone https://github.com/NataliaIakovleva/$REPO_NAME;
 
cd ./$REPO_NAME;
 
mvn package;

echo "Run tests ..."

cd target;

pwd;

java -cp QA-1.1-jar-with-dependencies.jar $MAIN_CLASS;