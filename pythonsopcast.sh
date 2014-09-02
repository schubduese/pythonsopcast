#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os

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
        if zeile.startswith("playerport"):
            playerPort=zeile.split("=")[1]
        if zeile.startswith("channel"):
            s = zeile.split("=")[1]
            channelList.append((s.split(",")[0],s.split(",")[1]))
    datei.close    
    print "Sopcast: " + sopcastPath
    print "localport" + localPort
    print "playerport" + playerPort

    for channel in channelList:
        print "Channel" + channel[0] + ":: URL:" + channel[1]
            
def testConfigParameter():
    if not (sopcastPath) or not(localPort) or not (playerPort):
        print "nein"

def startSopcast():
    channelNummer = -1
    print "Channelnummer wählen"
    for channel in channelList:
        channelNummer = channelNummer +1
        print "[" + str(channelNummer) +"] "+  channel[0]
    channelNummer = input()
    print "sadf" + sopcastPath
    aufruf=sopcastPath +" " + channelList[channelNummer][1] + " " + localPort + " " + playerPort
    print aufruf
    os.system(aufruf)

readConfig()
startSopcast()
