/*
encode(Plaintext, Ciphertext).

decode(Ciphertext, Plaintext).

*/

encode(String, R):- string_chars(String, List), 
compress(List, R).

compress([H1, H1|Tail]):- 
  compress(Tail, [HR|R]), number_chars(N, HR),

take_number(List, )  
