﻿INSERT INTO HardwareGroups VALUES (NULL, (SELECT Hardware_ID FROM Hardware WHERE ScanIP = @ScanIP AND DiscoveredHostName = @DiscoveredHostName AND FQDN = @FQDN AND NetBIOS = @NetBIOS), (SELECT Group_ID FROM Groups WHERE GroupName = @GroupName));