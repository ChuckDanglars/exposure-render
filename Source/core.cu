/*
	Copyright (c) 2011, T. Kroes <t.kroes@tudelft.nl>
	All rights reserved.

	Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

	- Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
	- Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
	- Neither the name of the TU Delft nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
	
	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#define __CUDA_ARCH__ 200


#include "tracer.h"
#include "volume.h"
#include "light.h"
#include "object.h"
#include "clippingobject.h"
#include "texture.h"
#include "bitmap.h"

DEVICE ExposureRender::Tracer*			gpTracer			= NULL;
DEVICE ExposureRender::Volume* 			gpVolumes			= NULL;
DEVICE ExposureRender::Light*			gpLights			= NULL;
DEVICE ExposureRender::Object*			gpObjects			= NULL;
DEVICE ExposureRender::ClippingObject*	gpClippingObjects	= NULL;
DEVICE ExposureRender::Texture*			gpTextures			= NULL;
DEVICE ExposureRender::Bitmap*			gpBitmaps			= NULL;

ExposureRender::Cuda::List<ExposureRender::Volume, ExposureRender::ErVolume>						gVolumes("gpVolumes");/*
ExposureRender::Cuda::List<ExposureRender::Light>						gLights("gpLights");
ExposureRender::Cuda::List<ExposureRender::Object>						gObjects("gpObjects");
ExposureRender::Cuda::List<ExposureRender::ClippingObject>				gClippingObjects("gpClippingObjects");
ExposureRender::Cuda::List<ExposureRender::Texture>						gTextures("gpTextures");
ExposureRender::Cuda::List<ExposureRender::Bitmap>						gBitmaps("gpBitmaps");

ExposureRender::Cuda::SynchronizeSingle<ExposureRender::Tracer>			gTracers("gpTracer");
ExposureRender::Cuda::SynchronizeSingle<ExposureRender::FrameBuffer>	gFrameBuffers("gpFrameBuffer");


#include "utilities.h"

#include "singlescattering.cuh"
#include "estimate.cuh"
#include "toneMap.cuh"
#include "gaussianfilter.cuh"
*/

namespace ExposureRender
{

EXPOSURE_RENDER_DLL void BindTracer(const ErTracer& Tracer)
{
	DebugLog("BindTracer()");
//	gTracers.Bind(Tracer);
}

EXPOSURE_RENDER_DLL void UnbindTracer(int TracerID)
{
	DebugLog("UnbindTracer()");
//	gTracers.Unbind(TracerID);
}

EXPOSURE_RENDER_DLL void BindVolume(const ErVolume& Volume)
{
	DebugLog("BindVolume()");
	gVolumes.Bind(Volume);
}

EXPOSURE_RENDER_DLL void UnbindVolume(int ID)
{
	DebugLog("UnbindVolume()");
//	gVolumes.Unbind(ID);
}

EXPOSURE_RENDER_DLL void BindLight(const ErLight& Light)
{
	DebugLog("BindLight()");
//	gLights.Bind(Light);
}

EXPOSURE_RENDER_DLL void UnbindLight(int ID)
{
	DebugLog("UnbindLight()");
//	gLights.Unbind(ID);
}

EXPOSURE_RENDER_DLL void BindObject(const ErObject& Object)
{
	DebugLog("BindObject()");
//	gObjects.Bind(Object);
}

EXPOSURE_RENDER_DLL void UnbindObject(int ID)
{
	DebugLog("UnbindObject()");
//	gObjects.Unbind(ID);
}

EXPOSURE_RENDER_DLL void BindClippingObject(const ErClippingObject& ClippingObject)
{
	DebugLog("BindClippingObject()");
//	gClippingObjects.Bind(ClippingObject);
}

EXPOSURE_RENDER_DLL void UnbindClippingObject(int ID)
{
	DebugLog("UnbindClippingObject()");
//	gClippingObjects.Unbind(ID);
}

EXPOSURE_RENDER_DLL void BindTexture(const ErTexture& Texture)
{
	DebugLog("BindTexture()");
//	gTextures.Bind(Texture);
}

EXPOSURE_RENDER_DLL void UnbindTexture(int ID)
{
	DebugLog("UnbindTexture()");
//	gTextures.Unbind(ID);
}

EXPOSURE_RENDER_DLL void BindBitmap(const ErBitmap& Bitmap)
{
	DebugLog("BindBitmap()");
//	gBitmaps.Bind(Bitmap);
}

EXPOSURE_RENDER_DLL void UnbindBitmap(int ID)
{
	DebugLog("UnbindBitmap()");
//	gBitmaps.Unbind(ID);
}

EXPOSURE_RENDER_DLL void RenderEstimate(int TracerID)
{
//	gTracers.Synchronize(TracerID);

//	SingleScattering(gFrameBuffers[TracerID].Resolution[0], gFrameBuffers[TracerID].Resolution[1]);
//	ComputeEstimate(gFrameBuffers[TracerID].Resolution[0], gFrameBuffers[TracerID].Resolution[1]);
//	FilterGaussian(Tracer.FrameBuffer.FrameEstimate.GetPtr(), Tracer.FrameBuffer.FrameEstimateTemp.GetPtr(), Tracer.FrameBuffer.Resolution[0], Tracer.FrameBuffer.Resolution[1]);
//	ToneMap(gFrameBuffers[TracerID].Resolution[0], gFrameBuffers[TracerID].Resolution[1]);

//	gTracers[TracerID].NoIterations++;
}

EXPOSURE_RENDER_DLL void GetEstimate(int TracerID, unsigned char* pData)
{
//	Cuda::MemCopyDeviceToHost(gFrameBuffers[TracerID].DisplayEstimate.GetPtr(), (ColorRGBAuc*)pData, gFrameBuffers[TracerID].DisplayEstimate.GetNoElements());
}

EXPOSURE_RENDER_DLL void GetAutoFocusDistance(int TracerID, int FilmU, int FilmV, float& AutoFocusDistance)
{
//	ComputeAutoFocusDistance(FilmU, FilmV, AutoFocusDistance);
}

EXPOSURE_RENDER_DLL void GetNoIterations(int TracerID, int& NoIterations)
{
//	NoIterations = gTracers[TracerID].NoIterations; 
}

}