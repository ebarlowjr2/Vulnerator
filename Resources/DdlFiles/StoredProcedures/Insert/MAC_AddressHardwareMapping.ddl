﻿INSERT INTO Hardware_MAC_Addresses VALUES (NULL, (SELECT Hardware_ID FROM Hardware WHERE ScanIP = @ScanIP AND DiscoveredHostName = @DiscoveredHostName), (SELECT MAC_Address_ID FROM MAC_Addresses WHERE MAC_Address = @MAC_Address));