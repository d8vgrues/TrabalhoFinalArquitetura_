INICIA
		XOR		R5, R5      ;Zerando os registradores a serem usados
		XOR		R7, R7
		XOR		R0, R0
		XOR		R4, R4
		ADD     	R5, R5, #2      ;Adiciona o numero base da PG (2) em R5
		ADD		R7, R7, R5	;R7 = registrador da dupla
		ADD		R0, R0, #200
		ADD		R0, R0, #200
		ADD		R0, R0, #200
		ADD		R0, R0, #100    ;X=7 (posicao base da memoria = X*100 = 700)

		ADD		R4, R4, #1  	;Inicia contador
		STR		R7, [R0]     	;Salva o primeiro valor da PG
		
LOOP
		TST		R7, #2147483648 ;verifica se o valor da PG é maior que 2^31
		BNE		FIM             ;se for, finaliza o codigo
		LSL		R7, R7, #1  	;senão, multiplica por 2
		ADD		R4, R4, #1	    ;incrementa o contador
		ADD		R0, R0, #4  	;incrementa endereco de memoria
		STR		R7, [R0]        ;salva valor na memoria
		CMP		R4, #10	    	;verifica se fez 10 iteracoes
		BEQ		FIM             ;caso tenha feito, finaliza o codigo
		B		LOOP            ;caso contrario, reinicia o loop
FIM
