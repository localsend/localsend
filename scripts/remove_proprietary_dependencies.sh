#!/bin/sh

# This script removes proprietary dependencies from the project.

cd app

REGEX_A="s/\/\/ \[FOSS_REMOVE_START\]/\/*/"
REGEX_B="s/\/\/ \[FOSS_REMOVE_END\]/\*\//"

# Remove lines from pubspec.yaml
sed -i '/# \[FOSS_REMOVE\]/d' pubspec.yaml

# Comment out parts in Dart files
sed -i "$REGEX_A" lib/init.dart
sed -i "$REGEX_B" lib/init.dart

sed -i "$REGEX_A" lib/pages/donation/donation_page.dart
sed -i "$REGEX_B" lib/pages/donation/donation_page.dart

sed -i "$REGEX_A" lib/pages/donation/donation_page_vm.dart
sed -i "$REGEX_B" lib/pages/donation/donation_page_vm.dart

# Remove files completely
rm lib/provider/purchase_provider.dart

# Refer to donationPageNoopVmProvider instead of donationPageVmProvider
sed -i 's/donationPageVmProvider/donationPageNoopVmProvider/g' lib/pages/donation/donation_page.dart

cd ..
echo "Proprietary dependencies removed."
