.global stringlen
.global stringcpy

// stringlen 함수: 문자열 길이 계산
stringlen:
    SUB SP, SP, #16        // 스택에 16바이트 공간 확보    
    STUR X20, [SP, #8]     // X20 레지스터 저장
    STUR X19, [SP, #0]     // X19 레지스터 저장


    MOV X19, X0            // 문자열의 주소를 X19에 저장
    MOV X0, #0             // 길이 카운터를 X0에 초기화

loop1:
    ADD X20, X19, X0       // 문자 주소 계산
    LDURB W21, [X20]       // 현재 문자를 로드
    CBZ W21, exit1         // 문자가 널이면 루프 종료
    ADD X0, X0, #1         // 길이 카운터 증가
    B loop1                // 루프 계속

exit1:
    LDUR X19, [SP, #0]     // X19 레지스터 복원
    LDUR X20, [SP, #8]     // X20 레지스터 복원
    ADD SP, SP, #16        // 스택 포인터 복원
    BR LR                  // 함수 종료 및 호출자로 반환

// stringcpy 함수: 문자열 복사
stringcpy:
    SUB SP, SP, #16        // 스택에 16바이트 공간 확보
    STUR X20, [SP, #8]     // X20 레지스터 저장
    STUR X19, [SP, #0]     // X19 레지스터 저장

    MOV X19, X0            // 목적지 문자열 주소를 X19에 저장
    MOV X20, X1            // 소스 문자열 주소를 X20에 저장

loop2:
    LDURB W21, [X20]       // 소스 문자열에서 문자를 로드
    STURB W21, [X19]       // 목적지 문자열에 문자를 저장
    CBZ W21, exit2         // 로드한 문자가 널이면 루프 종료
    ADD X19, X19, #1       // 목적지 주소 증가
    ADD X20, X20, #1       // 소스 주소 증가
    B loop2                // 루프 계속

exit2:
    LDUR X19, [SP, #0]     // X19 레지스터 복원
    LDUR X20, [SP, #8]     // X20 레지스터 복원
    ADD SP, SP, #16        // 스택 포인터 복원
    BR LR                  // 함수 종료 및 호출자로 반환
