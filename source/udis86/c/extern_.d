/* udis86 - libudis86/extern.h
 *
 * Copyright (c) 2002-2013 Vivek Thampi
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, 
 * are permitted provided that the following conditions are met:
 *
 *     * Redistributions of source code must retain the above copyright notice, 
 *       this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright notice, 
 *       this list of conditions and the following disclaimer in the documentation 
 *       and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR 
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES 
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; 
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON 
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

module udis86.c.extern_;

import udis86.c.types;
import udis86.c.itab;

import core.stdc.stdio;

extern (C):

void ud_init(ud*);
void ud_set_mode(ud*, ubyte);
void ud_set_pc(ud*, ulong);
void ud_set_input_hook(ud*, int function(ud*));
void ud_set_input_buffer(ud*, const(ubyte)*, size_t);
void ud_set_input_file(ud*, FILE*);
void ud_set_vendor(ud*, uint);
void ud_set_syntax(ud*, void function(ud*));
void ud_input_skip(ud*, size_t);
int ud_input_end(const(ud)*);
uint ud_decode(ud*);
uint ud_disassemble(ud*);
void ud_translate_intel(ud*);
void ud_translate_att(ud*);
const(char)* ud_insn_asm(const(ud)* u);
const(ubyte)* ud_insn_ptr(const(ud)* u);
ulong ud_insn_off(const(ud)*);
const(char)* ud_insn_hex(ud*);
uint ud_insn_len(const(ud)* u);
const(ud_operand)* ud_insn_opr(const(ud)* u, uint n);
int ud_opr_is_sreg(const(ud_operand)* opr);
int ud_opr_is_gpr(const(ud_operand)* opr);
ud_mnemonic_code ud_insn_mnemonic(const(ud)* u);
const(char)* ud_lookup_mnemonic(ud_mnemonic_code c);
void ud_set_user_opaque_data(ud*, void*);
void* ud_get_user_opaque_data(const(ud)*);
ulong ud_insn_sext_imm(const(ud)*, const(ud_operand)*);
void ud_set_asm_buffer(ud* u, char* buf, size_t size);
void ud_set_sym_resolver(ud* u, const(char)* function(ud*, ulong, long*) resolver);
