#export CROSS_COMPILE=$(pwd)/aarch64-linux-gnu/bin/aarch64-linux-gnu-
#export CROSS_COMPILE_ARM32=$(pwd)/aarch64-linux-gnu/bin/aarch64-linux-gnu-

#export CROSS_COMPILE=$(pwd)/aarch64-linux-android-4.9/bin/aarch64-linux-android-
#export CROSS_COMPILE_ARM32=$(pwd)/arm-linux-androideabi-4.9/bin/arm-linux-androideabi-

export CROSS_COMPILE=$(pwd)/aarch64/bin/aarch64-elf-
export CROSS_COMPILE_ARM32=$(pwd)/arm/bin/arm-eabi-

export ARCH=arm64
export SUBARCH=arm64

#build
mkdir -p out
make O=out clean
make O=out mrproper
make O=out gemini_defconfig
make O=out -j$(nproc --all)

rm ../AnyKernel3/Image*
rm ../AnyKernel3/kernel*
cp out/arch/arm64/boot/Image.gz-dtb ../AnyKernel3/

cd ../AnyKernel3

date=`date '+%Y-%m-%d_%H:%M'`

zip -r9 kernel-$date.zip * -x README.md kernel-$date.zip
