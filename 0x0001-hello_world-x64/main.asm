extrn MessageBoxA: proc
extrn ExitProcess: proc

.data
	msg_txt	    db 'Hello World', 0
	msg_caption db 'Hello World App', 0

.code
	main proc
		sub	rsp, 20h			;shadow stack

		mov	r9, rax				;UINT uType
		lea	r8, msg_caption			;LPCSTR	lpCaption
		lea	rdx, msg_txt			;LPCSTR	lpText
		xor	rcx, rcx			;HWND hWnd
		call	MessageBoxA			;https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-messageboxa
		
		add rsp, 20h				;restore shadow stack

		mov rcx, rax				;UNIT uExitCode
		call ExitProcess			;https://docs.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-exitprocess

		ret
	main endp
end
