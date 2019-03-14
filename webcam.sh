#!/bin/bash
mplayer tv:// -tv driver=v4l2:width=400:height=300 -vo xv -geometry 100%:100% -noborder
