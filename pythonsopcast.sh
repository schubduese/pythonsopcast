#!/usr/bin/env python
# -*- coding: utf-8 -*-

dateiname="pythonsopcast.conf"
sopcastPath=""
localPort=""
playerPort=""
channelList = []


def readConfig():
    datei=open(dateiname, "r")
    for zeile in datei:
        if zeile.startswith("sopcast"):
            sopcastPath=zeile.split("=")[1]
        if zeile.startswith("localport"):
            localPort=zeile.split("=")[1]
        if zeile.startswith("channel"):
            s = zeile.split("=")[1]
            channelList.append((s.split(",")[0],s.split(",")[1]))
    datei.close    
    print "Sopcast: " + sopcastPath
    print "localport" + localPort
    print "playerport" + playerPort

    for channel in channelList:
        print "Channel" + channel[0] + ":: URL:" + channel[1]
            

    
readConfig()
