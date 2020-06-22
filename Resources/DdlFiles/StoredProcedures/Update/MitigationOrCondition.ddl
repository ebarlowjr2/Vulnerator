﻿UPDATE MitigationsOrConditions 
SET 
	ImpactDescription = @ImpactDescription,
	PredisposingConditions = @PredisposingConditions,
	TechnicalMitigation = @TechnicalMitigation,
	ProposedMitigation = @ProposedMitigation,
	ThreatRelevance = @ThreatRelevance,
	SeverityPervasiveness = @SeverityPervasiveness,
	Likelihood = @Likelihood,
	Impact = @Impact,
	Risk = @Risk,
	ResidualRisk = @ResidualRisk,
	MitigatedStatus = @MitigatedStatus,
	ExpirationDate = @ExpirationDate,
EstimatedCompletionDate = @EstimatedCompletionDate,
ApprovalDate = @ApprovalDate,
ResidualRiskAfterProposed = @ResidualRiskAfterProposed,
	IsApproved = @IsApproved,
	Approver = @Approver
WHERE MitigationOrCondition_ID = @MitigationOrCondition_ID;