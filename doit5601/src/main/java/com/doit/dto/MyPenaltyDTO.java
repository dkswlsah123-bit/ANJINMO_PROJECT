package com.doit.dto;

public class MyPenaltyDTO {

//	
//  PENALTY_ID, PENALTY_TYPE_NAME, GIVEN_SCORE, ACCUMULATED_SCORE
//	, TOTAL_SCORE, HISTORY_STATUS, PENALTY_CREATED_AT
//	, PENALTY_START_DATE, PENALTY_END_DATE
//	, PENALTY_ASSIGN_ADMIN
//	, PENALTY_CANCEL_ID, CANCEL_REASON, CANCELED_AT
//	, PENALTY_CANCEL_ADMIN
	
	private int penaltyId, givenScore, accumulatedScore, totalScore, penaltyAssignAdmin, penaltyCancelId, penaltyCancelAdmin;
	private String penaltyTypeName, historyStatus, penaltyCreatedAt, penaltyStartDate, penaltyEndDate, cancleReason, canceledAt;
	public int getPenaltyId() {
		return penaltyId;
	}
	public void setPenaltyId(int penaltyId) {
		this.penaltyId = penaltyId;
	}
	public int getGivenScore() {
		return givenScore;
	}
	public void setGivenScore(int givenScore) {
		this.givenScore = givenScore;
	}
	public int getAccumulatedScore() {
		return accumulatedScore;
	}
	public void setAccumulatedScore(int accumulatedScore) {
		this.accumulatedScore = accumulatedScore;
	}
	public int getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}
	public int getPenaltyAssignAdmin() {
		return penaltyAssignAdmin;
	}
	public void setPenaltyAssignAdmin(int penaltyAssignAdmin) {
		this.penaltyAssignAdmin = penaltyAssignAdmin;
	}
	public int getPenaltyCancelId() {
		return penaltyCancelId;
	}
	public void setPenaltyCancelId(int penaltyCancelId) {
		this.penaltyCancelId = penaltyCancelId;
	}
	public int getPenaltyCancelAdmin() {
		return penaltyCancelAdmin;
	}
	public void setPenaltyCancelAdmin(int penaltyCancelAdmin) {
		this.penaltyCancelAdmin = penaltyCancelAdmin;
	}
	public String getPenaltyTypeName() {
		return penaltyTypeName;
	}
	public void setPenaltyTypeName(String penaltyTypeName) {
		this.penaltyTypeName = penaltyTypeName;
	}
	public String getHistoryStatus() {
		return historyStatus;
	}
	public void setHistoryStatus(String historyStatus) {
		this.historyStatus = historyStatus;
	}
	public String getPenaltyCreatedAt() {
		return penaltyCreatedAt;
	}
	public void setPenaltyCreatedAt(String penaltyCreatedAt) {
		this.penaltyCreatedAt = penaltyCreatedAt;
	}
	public String getPenaltyStartDate() {
		return penaltyStartDate;
	}
	public void setPenaltyStartDate(String penaltyStartDate) {
		this.penaltyStartDate = penaltyStartDate;
	}
	public String getPenaltyEndDate() {
		return penaltyEndDate;
	}
	public void setPenaltyEndDate(String penaltyEndDate) {
		this.penaltyEndDate = penaltyEndDate;
	}
	public String getCancleReason() {
		return cancleReason;
	}
	public void setCancleReason(String cancleReason) {
		this.cancleReason = cancleReason;
	}
	public String getCanceledAt() {
		return canceledAt;
	}
	public void setCanceledAt(String canceledAt) {
		this.canceledAt = canceledAt;
	}
	
	
	
	
}
