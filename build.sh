export USE_CCACHE=1
ccache -M 50G
. build/envsetup.sh
lunch aosp_gemini-userdebug && mka bacon -j$( nproc --all)
