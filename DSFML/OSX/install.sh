#!/bin/sh

###
### Install package for SFML 2.1 on OS X
###
### Author: Marco Antognini <antognini.marco@gmail.com>
### Date: 26/07/2013
###
### Edited By: Jeremy DeHaan <dehaan.jeremiah@gmail.com>
### Date: 02/06/2014
### Edited For: Installing DSFML on OS X

### This script install the following:
###
### extlibs/        into    /Library/Frameworks/
### Frameworks/     into    /Library/Frameworks/
### lib/            into    /usr/local/lib/
###


###
### USAGE
###
### $0 [package]
###
### Package is optional. It represent the path to a package.
### If not present, package is assumed to be $(dirname "$0")
###
### When installing frameworks the script will ask you for
### your password.
###


##
## HELPER FUNCTIONS
##

## Echoes to stderr, and die
error () # $* message to display
{
    echo "$@" 1>&2
    exit 2
}

## Check that the number of parameters is correct
param_check () # $1 should be $# on call site,
               # $2 the number of required params,
               # $3 an id for the error message
{
    if [ $# -ne 3 ]
    then
        error "Internal error in param_error: the number of parameters is incorrect"
    fi

    if [ $1 -ne $2 ]
    then
        error "Internal error in $3: the number of parameters is incorrect"
    fi
}

## Check that the number of parameters is enough
param_check_ge () # $1 should be $# on call site,
                  # $2 the minimal number of parames,
                  # $3 an id for the error message
{
    param_check $# 3 "param_check_ge"

    if [ $1 -lt $2 ]
    then
        error "Internal error in $3: the number of parameters is not enough"
    fi
}

## Assert $1 is true, or die
assert () # $1: boolean, $2: an error message
{
    param_check $# 2 "assert"

    if [ $1 -ne 0 ]
    then
        error "$2"
    fi
}

## Create directory, or die
# === mkdir -p $1
create_dir () # $1: path
{
    param_check $# 1 "create_dir"
    mkdir -p "$1"
    assert $? "Couldn't create $1"
}

## Destroy directory, or die
# === rm -fr $1
destroy () # $1: path
{
    param_check $# 1 "destroy"
    rm -fr "$1"
    assert $? "Couldn't destroy $1"
}

## Copy files/directories, recursively, or die
install () # $1...N: src, $N+1: dest
{
    param_check_ge $# 2 "install"
    ditto "$@"
    assert $? "Couldn't install $1"
}

## [with root access] Copy files/directories, recursively, or die
sudo_install () # $1...N: src, $N+1: dest
{
    param_check_ge $# 2 "install"
    sudo ditto "$@"
    assert $? "Couldn't install $1"
}


##
## MAIN FUNCTION
##

if [ -n "$1" ]
then
    package="$1"
else
    package=$(dirname "$0")
fi

echo "INSTALLING PACKAGE $package"

cd "$package"
assert $? "Couldn't go to the package directory $package"

echo "Installing Frameworks [with root access]"
sudo_install "extlibs/" "Frameworks/" "/Library/Frameworks"

echo "Installing dylibs"
sudo_install "lib/" "/usr/local/lib/"


echo "Installation DONE"
