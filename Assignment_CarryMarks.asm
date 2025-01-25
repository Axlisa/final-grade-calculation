TITLE Assignment_CarryMarks  (Assignment_CarryMarks.asm)

INCLUDE Irvine32.inc

.data
    studentName        BYTE 30 DUP(0)
    matricNum          BYTE 30 DUP(0)
	
	quiz1M		 	   DWORD ?	
	quiz2M		 	   DWORD ?
	ass1M		 	   DWORD ?	
	ass2M		 	   DWORD ?	
	ass3M		 	   DWORD ?	
	midtermM	 	   DWORD ?	
	finalM		 	   DWORD ?	
	
    totalQuiz          DWORD ?
    totalAss           DWORD ?
    totalMidtermM      DWORD ?   
    totalFinalM        DWORD ?
    totalGrade         DWORD ?
    Grade              BYTE  ?

    promptheader       BYTE "      ***............!Welcome to Final Grade Calculator!.........***", 0
    promptName         BYTE "               Name                          : ", 0
    promptMatric       BYTE "               Matric Number [ex: 123456789] : ", 0
	
    promptQuiz         BYTE "                        ***Enter Your Total Marks***                ", 0
	receiveQuiz1       BYTE "               QUIZ 1       (MAX:10) : ", 0
	receiveQuiz2       BYTE "               QUIZ 2       (MAX:15) : ", 0
	receiveAss1        BYTE "               ASSIGNMENT 1 (MAX:20) : ", 0
	receiveAss2        BYTE "               ASSIGNMENT 2 (MAX:20) : ", 0
	receiveAss3        BYTE "               ASSIGNMENT 3 (MAX:20) : ", 0
	receiveMidTerm     BYTE "               MIDTERM EXAM (MAX:100): ", 0
	receiveFinal       BYTE "               FINAL EXAM   (MAX:100): ", 0

    ResultHeader       BYTE "      ***.....................#Results#...........................***", 0
    ResultName         BYTE "                NAME             : ", 0
    ResultMatric       BYTE "                MATRIC NUMBER    : ", 0
	
	PromptPercentage   BYTE "                        ***Your Total Percentage***                  ", 0
	ResultQuiz 		   BYTE "                QUIZ             : ", 0
	ResultAss 		   BYTE "                ASSIGNMENT       : ", 0
	ResultMidTerm 	   BYTE "                MIDTERM EXAM     : ", 0
	ResultFinal 	   BYTE "                FINAL EXAM       : ", 0
    ResultTotalPercent BYTE "                TOTAL PERCENTAGE : ", 0
    ResultGrade        BYTE "                GRADE            : ", 0
	
	Percentage         BYTE "%"                                      , 0
	InvalidInput       BYTE "             !Invalid!                 ", 0

.code
main PROC
;DISPLAY PROGRAM HEADER
    call Crlf
    mov edx, OFFSET promptheader
    call WriteString
    call Crlf
    call Crlf

	;Student Information
    ;Name
    mov edx, OFFSET promptName     
    call WriteString
    mov edx, OFFSET studentName
    mov ecx, SIZEOF studentName - 1
    call ReadString
	
    ;Matric Num
    mov edx, OFFSET promptMatric     
    call WriteString
    mov edx, OFFSET matricNum
    call ReadString
    call Crlf
	
;QUIZ HEADER
    call Crlf
    mov edx, OFFSET promptQuiz
    call WriteString
    call Crlf
	
;QUIZ
;Prompt User
L_Quiz1 :
		mov edx, OFFSET receiveQuiz1
		call WriteString
		call ReadInt
		mov quiz1M, eax

		.IF quiz1M <= -1 && quiz1M >= 11
			mov edx,OFFSET InvalidInput		
			call WriteString
			call Crlf
			call Crlf
			loop L_Quiz1
		.ENDIF
		
L_Quiz2 :
		mov edx, OFFSET receiveQuiz2
		call WriteString
		call ReadInt
		mov quiz2M, eax
	
		.IF quiz2M <= -1 && quiz2M >= 16
			mov edx,OFFSET InvalidInput		
			call WriteString
			call Crlf
			call Crlf
			loop L_Quiz2
		.ENDIF
	
	;Calculate Quiz
	mov eax, quiz1M
	add eax, quiz2M
	mov totalQuiz, eax
	
	mov eax, totalQuiz
	imul eax, 10
	mov totalQuiz, eax
	
	mov eax, totalQuiz
	mov ebx, 25
	cdq
	idiv ebx
	mov totalQuiz, eax
	
;ASSIGNMENT
;Prompt User
L_Ass1 :
		mov edx, OFFSET receiveAss1
		call WriteString
		call ReadInt
		mov ass1M, eax
		
		.IF ass1M <= -1 && ass1M >= 21
			mov edx,OFFSET InvalidInput		
			call WriteString
			call Crlf
			call Crlf
			loop L_Ass1
		.ENDIF

L_Ass2 :
		mov edx, OFFSET receiveAss2
		call WriteString
		call ReadInt
		mov ass2M, eax
	
		.IF ass2M <= -1 && ass2M >= 21
			mov edx,OFFSET InvalidInput		
			call WriteString
			call Crlf
			call Crlf
			loop L_Ass2
		.ENDIF

L_Ass3 :
		mov edx, OFFSET receiveAss3
		call WriteString
		call ReadInt
		mov ass3M, eax
		
		.IF ass3M <= -1 && ass3M >= 21
			mov edx,OFFSET InvalidInput		
			call WriteString
			call Crlf
			call Crlf
			loop L_Ass3
		.ENDIF	
	
	;Calculate Assignment
	mov eax, ass1M
	add eax, ass2M
	add eax, ass3M
	mov totalAss, eax
	
	mov eax, totalAss
	imul eax, 30
	mov totalAss, eax
	
	mov eax, totalAss
	mov ebx, 60
	cdq
	idiv ebx
	mov totalAss, eax
	
;MIDTERM EXAM
;Prompt User
L_MidTerm :
		mov edx, OFFSET receiveMidTerm
		call WriteString
		call ReadInt
		mov totalMidtermM, eax
	
		.IF totalMidtermM <= -1 && totalMidtermM >= 101
			mov edx,OFFSET InvalidInput		
			call WriteString
			call Crlf
			call Crlf
			loop L_MidTerm
		.ENDIF	
	
	mov eax, totalMidtermM
	imul eax, 20
	mov totalMidtermM, eax
	
	;Calculate Midterm
	mov eax, totalMidtermM
	mov ebx, 100
	cdq
	idiv ebx
	mov totalMidtermM, eax
	
;FINAL EXAM
;Prompt User
L_Final :
		mov edx, OFFSET receiveFinal
		call WriteString
		call ReadInt
		mov totalFinalM, eax
		
		.IF totalFinalM <= -1 && totalFinalM >= 101
			mov edx,OFFSET InvalidInput		
			call WriteString
			call Crlf
			call Crlf
			loop L_Final
		.ENDIF	
	
	;Calculate Final
	mov eax, totalFinalM
	imul eax, 40
	mov totalFinalM, eax
	
	mov eax, totalFinalM
	mov ebx, 100
	cdq
	idiv ebx
	mov totalFinalM, eax
	call Crlf
	call Crlf
	
; CALCULATE GRADE
    ;Calculate Total Marks
    mov eax, totalQuiz
    add eax, totalAss
    add eax, totalMidtermM
    add eax, totalFinalM
    mov totalGrade, eax
	
	;Determine The Grade Based On The Total Marks
	.IF totalGrade >= 90 && totalGrade <=100
	  mov Grade,'A'	
	.ELSEIF totalGrade >= 80 && totalGrade <=89
	  mov Grade,'B'
	.ELSEIF totalGrade >= 70 && totalGrade <=79
	  mov Grade,'C'
	.ELSEIF totalGrade >= 60 && totalGrade <=69
	  mov Grade,'D'
	.ELSE
	  mov Grade,'F'
	.ENDIF
	
	
;DISPLAY THE RESULT HEADER
    mov edx, OFFSET ResultHeader
    call WriteString
    call Crlf

	;Student Information
    mov edx, OFFSET ResultName
    call WriteString
    mov edx, OFFSET studentName
    call WriteString
    call Crlf

    mov edx, OFFSET ResultMatric
    call WriteString
    mov edx, OFFSET matricNum
    call WriteString
    call Crlf
	call Crlf

;DISPLAY THE PERCENTAGE HEADER
	mov edx, OFFSET PromptPercentage
    call WriteString
    call Crlf
	
	;Quiz
	mov edx, OFFSET ResultQuiz
    call WriteString
    mov eax, totalQuiz
    call WriteDec
	mov edx, OFFSET percentage
    call WriteString
    call Crlf

	;Assignment
	mov edx, OFFSET ResultAss
    call WriteString
    mov eax, totalAss
    call WriteDec
	mov edx, OFFSET percentage
    call WriteString
    call Crlf

	;Midterm Exam
	mov edx, OFFSET ResultMidTerm
    call WriteString
    mov eax, totalMidtermM
    call WriteDec
	mov edx, OFFSET percentage
    call WriteString
    call Crlf

	;Final Exam
	mov edx, OFFSET ResultFinal
    call WriteString
    mov eax, totalFinalM
    call WriteDec
	mov edx, OFFSET percentage
    call WriteString
    call Crlf
	
	;Total Percentage
    mov edx, OFFSET ResultTotalPercent
    call WriteString
    mov eax, totalGrade
    call WriteDec
	mov edx, OFFSET percentage
    call WriteString
    call Crlf
	
	;Grade
    mov edx, OFFSET ResultGrade
    call WriteString
	mov al, Grade
    call WriteChar
    call Crlf

;Use Irvine32 library's WaitMsg
    call WaitMsg

    exit
main ENDP

END main