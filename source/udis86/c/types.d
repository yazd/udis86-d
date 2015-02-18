/* udis86 - libudis86/types.h
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

module udis86.c.types;

import udis86.c.extern_;
import udis86.c.itab;

import core.stdc.stdio;

extern (C):

/// All possible "types" of objects in udis86. Order is Important!
enum ud_type
{
  UD_NONE,
  /* 8 bit GPRs */
  UD_R_AL, UD_R_CL, UD_R_DL, UD_R_BL,
  UD_R_AH, UD_R_CH, UD_R_DH, UD_R_BH,
  UD_R_SPL, UD_R_BPL, UD_R_SIL, UD_R_DIL,
  UD_R_R8B, UD_R_R9B, UD_R_R10B, UD_R_R11B,
  UD_R_R12B, UD_R_R13B, UD_R_R14B, UD_R_R15B,
  /* 16 bit GPRs */
  UD_R_AX, UD_R_CX, UD_R_DX, UD_R_BX,
  UD_R_SP, UD_R_BP, UD_R_SI, UD_R_DI,
  UD_R_R8W, UD_R_R9W, UD_R_R10W, UD_R_R11W,
  UD_R_R12W, UD_R_R13W, UD_R_R14W, UD_R_R15W,
  /* 32 bit GPRs */
  UD_R_EAX, UD_R_ECX, UD_R_EDX, UD_R_EBX,
  UD_R_ESP, UD_R_EBP, UD_R_ESI, UD_R_EDI,
  UD_R_R8D, UD_R_R9D, UD_R_R10D, UD_R_R11D,
  UD_R_R12D, UD_R_R13D, UD_R_R14D, UD_R_R15D,
  /* 64 bit GPRs */
  UD_R_RAX, UD_R_RCX, UD_R_RDX, UD_R_RBX,
  UD_R_RSP, UD_R_RBP, UD_R_RSI, UD_R_RDI,
  UD_R_R8, UD_R_R9, UD_R_R10, UD_R_R11,
  UD_R_R12, UD_R_R13, UD_R_R14, UD_R_R15,
  /* segment registers */
  UD_R_ES, UD_R_CS, UD_R_SS, UD_R_DS,
  UD_R_FS, UD_R_GS,
  /* control registers*/
  UD_R_CR0, UD_R_CR1, UD_R_CR2, UD_R_CR3,
  UD_R_CR4, UD_R_CR5, UD_R_CR6, UD_R_CR7,
  UD_R_CR8, UD_R_CR9, UD_R_CR10, UD_R_CR11,
  UD_R_CR12, UD_R_CR13, UD_R_CR14, UD_R_CR15,
  /* debug registers */
  UD_R_DR0, UD_R_DR1, UD_R_DR2, UD_R_DR3,
  UD_R_DR4, UD_R_DR5, UD_R_DR6, UD_R_DR7,
  UD_R_DR8, UD_R_DR9, UD_R_DR10, UD_R_DR11,
  UD_R_DR12, UD_R_DR13, UD_R_DR14, UD_R_DR15,
  /* mmx registers */
  UD_R_MM0, UD_R_MM1, UD_R_MM2, UD_R_MM3,
  UD_R_MM4, UD_R_MM5, UD_R_MM6, UD_R_MM7,
  /* x87 registers */
  UD_R_ST0, UD_R_ST1, UD_R_ST2, UD_R_ST3,
  UD_R_ST4, UD_R_ST5, UD_R_ST6, UD_R_ST7,
  /* extended multimedia registers */
  UD_R_XMM0, UD_R_XMM1, UD_R_XMM2, UD_R_XMM3,
  UD_R_XMM4, UD_R_XMM5, UD_R_XMM6, UD_R_XMM7,
  UD_R_XMM8, UD_R_XMM9, UD_R_XMM10, UD_R_XMM11,
  UD_R_XMM12, UD_R_XMM13, UD_R_XMM14, UD_R_XMM15,
  /* 256B multimedia registers */
  UD_R_YMM0, UD_R_YMM1, UD_R_YMM2, UD_R_YMM3,
  UD_R_YMM4, UD_R_YMM5, UD_R_YMM6, UD_R_YMM7,
  UD_R_YMM8, UD_R_YMM9, UD_R_YMM10, UD_R_YMM11,
  UD_R_YMM12, UD_R_YMM13, UD_R_YMM14, UD_R_YMM15,
  UD_R_RIP,
  /* Operand Types */
  UD_OP_REG, UD_OP_MEM, UD_OP_PTR, UD_OP_IMM,
  UD_OP_JIMM, UD_OP_CONST
}

union ud_lval
{
  byte sbyte;
  ubyte ubyte_;
  short sword;
  ushort uword;
  int sdword;
  uint udword;
  long sqword;
  ulong uqword;
  Ptr ptr;

  struct Ptr
  {
    ushort seg;
    uint off;
  }
}

/// Disassembled instruction operand
struct ud_operand
{
  ud_type type;
  ubyte size;
  ud_type base;
  ud_type index;
  ubyte scale;
  ubyte offset;
  ud_lval lval;
  ulong _legacy;
  ubyte _oprcode;
}

/// udis86 object
struct ud
{
  int function (ud*) inp_hook;
  FILE* inp_file;
  const(ubyte)* inp_buf;
  size_t inp_buf_size;
  size_t inp_buf_index;
  ubyte inp_curr;
  size_t inp_ctr;
  ubyte[64] inp_sess;
  int inp_end;
  void function (ud*) translator;
  ulong insn_offset;
  char[64] insn_hexcode;

  /// Assembly output buffer
  char* asm_buf;
  size_t asm_buf_size;
  size_t asm_buf_fill;
  char[128] asm_buf_int;

  /// Symbol resolver for use in the translation phase
  const(char)* function (ud*, ulong, long*) sym_resolver;

  ubyte dis_mode;
  ulong pc;
  ubyte vendor;
  ud_mnemonic_code mnemonic;
  ud_operand[3] operand;
  ubyte error;
  ubyte pfx_rex;
  ubyte pfx_seg;
  ubyte pfx_opr;
  ubyte pfx_adr;
  ubyte pfx_lock;
  ubyte pfx_str;
  ubyte pfx_rep;
  ubyte pfx_repe;
  ubyte pfx_repne;
  ubyte opr_mode;
  ubyte adr_mode;
  ubyte br_far;
  ubyte br_near;
  ubyte have_modrm;
  ubyte modrm;
  ubyte primary_opcode;
  void* user_opaque_data;
  ud_itab_entry* itab_entry;
  ud_lookup_table_list_entry* le;
}

struct ud_itab_entry;
struct ud_lookup_table_list_entry;

alias ud_type_t = ud_type;
alias ud_mnemonic_code_t = ud_mnemonic_code;

alias ud_t = ud;
alias ud_operand_t = ud_operand;

enum UD_SYN_INTEL = &ud_translate_intel;
enum UD_SYN_ATT   = &ud_translate_att;

enum UD_EOI = -1;
enum UD_INP_CACHE_SZ = 32;
enum UD_VENDER_AMD = 0;
enum UD_VENDOR_INTEL = 1;
enum UD_VENDOR_ANY = 2;
