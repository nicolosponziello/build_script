export CROSS_COMPILE=~/Desktop/kernel/aarch64-elf-gcc-9.x/bin/aarch64-elf-
export CROSS_COMPILE_ARM32=~/Desktop/kernel/arm-eabi-gcc-9.x/bin/arm-eabi-


export ARCH=arm64
export SUBARCH=arm64

#build
mkdir -p out
make O=out clean
make O=out mrproper
make O=out gemini_defconfig
make O=out -j$(nproc --all)

rm ~/Desktop/kernel/AnyKernel3/Image*
rm ~/Desktop/kernel/AnyKernel3/kernel*
cp out/arch/arm64/boot/Image.gz-dtb ~/Desktop/kernel/AnyKernel3/

cd ~/Desktop/kernel/AnyKernel3

if [ ! -f "./Image.gz-dtb" ]; then
	echo "Kernel image file not found"
	exit 1
fi

date=`date '+%Y-%m-%d_%H:%M'`
date="${date//:}"

zip -r9 kernel-$date.zip * -x README.md kernel-$date.zip