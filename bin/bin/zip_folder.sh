#!/usr/bin/env bash
FOLDER=$1

if [ "$FOLDER" == "" ] ; then
    echo "Pls provide a folder"
    exit 1
fi

if [ ! -d $FOLDER ] ; then
    echo "$FOLDER is not a directory!"
    exit 1
fi

zip -9 -r -q ./$FOLDER.zip $FOLDER/*
