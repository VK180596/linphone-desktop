/*
 * VideoCodecsModel.cpp
 * Copyright (C) 2017-2018  Belledonne Communications, Grenoble, France
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 *
 *  Created on: April 3, 2017
 *      Author: Ronan Abhamon
 */

#include "../core/CoreManager.hpp"

#include "VideoCodecsModel.hpp"

using namespace std;

// =============================================================================

VideoCodecsModel::VideoCodecsModel (QObject *parent) : AbstractCodecsModel(parent) {
  bool exitOpenH264=false;
  for (auto &codec : CoreManager::getInstance()->getCore()->getVideoPayloadTypes()) {
    addCodec(codec);
	if(codec->getMimeType() == "h264") exitOpenH264=true;
  }
  
  if(!exitOpenH264)
  addDownloadableCodec("h264", "http://ciscobinary.openh264.org/libopenh264-1.5.0-android19.so.bz2");
}

void VideoCodecsModel::updateCodecs (list<shared_ptr<linphone::PayloadType> > &codecs) {
  CoreManager::getInstance()->getCore()->setVideoPayloadTypes(codecs);
}
