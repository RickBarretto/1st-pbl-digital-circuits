//! A simple 2x1 Multiplexer
//!
//! This may be used by other modules to select which data output, 
//! according to FLOYD (2007).
//!
//! Reference
//! ---------
//! FLOYD, T. Funções da Lógica Combinacional. 
//! In: JÚNIOR, A. P. (Ed.). Sistemas Digitais: Fundamentos e Aplicações. 
//! Tradução: José Lucimar Do Nascimento. Porto Alegre: Bookman, 2007. p. 312–364. 
//!
module multiplexer_2x1(
    output out, 
    
    input l0, 
    input l1, 
    input s
); 
   
    not (wire_a1, s);
   
    and (wire_b1, l0, wire_a1);
    and (wire_b2, l1, s); 
   
    or (out, wire_b1, wire_b2);

endmodule 