﻿SELECT
		UniqueVulnerabilityIdentifier,
		VulnerabilityVersion,
		VulnerabilityTitle,
		VulnerabilityDescription,
		SourceName,
		SourceVersion,
		SourceRelease, 
		Comments, 
		FindingDetails,
		RawRisk, 
		Status,
		DisplayedSoftwareName,
		GROUP_CONCAT(DISTINCt Reference) AS Reference,
		GROUP_CONCAT(DISTINCT ScanIP) AS IPs,
		GROUP_CONCAT(DISTINCT (Control_Family || '-' || Control_Number || '.' || Enhancement)) AS NIST_Controls
FROM Vulnerabilities
LEFT JOIN UniqueFindings ON Vulnerabilities.Vulnerability_ID = UniqueFindings.Vulnerability_ID
LEFT JOIN Software ON UniqueFindings.Software_ID = Software.Software_ID
LEFT JOIN Hardware ON UniqueFindings.Hardware_ID = Hardware.Hardware_ID
LEFT JOIN FindingTypes On UniqueFindings.FindingType_ID = FindingTypes.FindingType_ID
LEFT JOIN VulnerabilitiesCCIs ON Vulnerabilities.Vulnerability_ID = VulnerabilitiesCCIs.Vulnerability_ID
LEFT JOIN CCIs ON VulnerabilitiesCCIs.CCI_ID = CCIs.CCI_ID
LEFT JOIN NistControlsCCIs ON CCIs.CCI_ID = NistControlsCCIs.CCI_ID
LEFT JOIN NIST_Controls ON NistControlsCCIs.NIST_Control_ID = NIST_Controls.NIST_Control_ID
LEFT JOIN VulnerabilitiesVulnerabilitySources ON Vulnerabilities.Vulnerability_ID = VulnerabilitiesVulnerabilitySources.Vulnerability_ID
LEFT JOIN VulnerabilitySources ON VulnerabilitiesVulnerabilitySources.VulnerabilitySource_ID = VulnerabilitySources.VulnerabilitySource_ID
LEFT JOIN VulnerabilitiesVulnerabilityReferences ON Vulnerabilities.Vulnerability_ID = VulnerabilitiesVulnerabilityReferences.Vulnerability_ID
LEFT JOIN VulnerabilityReferences ON VulnerabilitiesVulnerabilityReferences.Reference_ID = VulnerabilityReferences.Reference_ID
WHERE FindingType = @FindingType
GROUP BY Status, UniqueVulnerabilityIdentifier, SourceVersion, SourceRelease
ORDER BY UniqueVulnerabilityIdentifier