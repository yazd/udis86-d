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
  UD_NONE = 0,
  UD_R_AL = 1,
  UD_R_CL = 2,
  UD_R_DL = 3,
  UD_R_BL = 4,
  UD_R_AH = 5,
  UD_R_CH = 6,
  UD_R_DH = 7,
  UD_R_BH = 8,
  UD_R_SPL = 9,
  UD_R_BPL = 10,
  UD_R_SIL = 11,
  UD_R_DIL = 12,
  UD_R_R8B = 13,
  UD_R_R9B = 14,
  UD_R_R10B = 15,
  UD_R_R11B = 16,
  UD_R_R12B = 17,
  UD_R_R13B = 18,
  UD_R_R14B = 19,
  UD_R_R15B = 20,
  UD_R_AX = 21,
  UD_R_CX = 22,
  UD_R_DX = 23,
  UD_R_BX = 24,
  UD_R_SP = 25,
  UD_R_BP = 26,
  UD_R_SI = 27,
  UD_R_DI = 28,
  UD_R_R8W = 29,
  UD_R_R9W = 30,
  UD_R_R10W = 31,
  UD_R_R11W = 32,
  UD_R_R12W = 33,
  UD_R_R13W = 34,
  UD_R_R14W = 35,
  UD_R_R15W = 36,
  UD_R_EAX = 37,
  UD_R_ECX = 38,
  UD_R_EDX = 39,
  UD_R_EBX = 40,
  UD_R_ESP = 41,
  UD_R_EBP = 42,
  UD_R_ESI = 43,
  UD_R_EDI = 44,
  UD_R_R8D = 45,
  UD_R_R9D = 46,
  UD_R_R10D = 47,
  UD_R_R11D = 48,
  UD_R_R12D = 49,
  UD_R_R13D = 50,
  UD_R_R14D = 51,
  UD_R_R15D = 52,
  UD_R_RAX = 53,
  UD_R_RCX = 54,
  UD_R_RDX = 55,
  UD_R_RBX = 56,
  UD_R_RSP = 57,
  UD_R_RBP = 58,
  UD_R_RSI = 59,
  UD_R_RDI = 60,
  UD_R_R8 = 61,
  UD_R_R9 = 62,
  UD_R_R10 = 63,
  UD_R_R11 = 64,
  UD_R_R12 = 65,
  UD_R_R13 = 66,
  UD_R_R14 = 67,
  UD_R_R15 = 68,
  UD_R_ES = 69,
  UD_R_CS = 70,
  UD_R_SS = 71,
  UD_R_DS = 72,
  UD_R_FS = 73,
  UD_R_GS = 74,
  UD_R_CR0 = 75,
  UD_R_CR1 = 76,
  UD_R_CR2 = 77,
  UD_R_CR3 = 78,
  UD_R_CR4 = 79,
  UD_R_CR5 = 80,
  UD_R_CR6 = 81,
  UD_R_CR7 = 82,
  UD_R_CR8 = 83,
  UD_R_CR9 = 84,
  UD_R_CR10 = 85,
  UD_R_CR11 = 86,
  UD_R_CR12 = 87,
  UD_R_CR13 = 88,
  UD_R_CR14 = 89,
  UD_R_CR15 = 90,
  UD_R_DR0 = 91,
  UD_R_DR1 = 92,
  UD_R_DR2 = 93,
  UD_R_DR3 = 94,
  UD_R_DR4 = 95,
  UD_R_DR5 = 96,
  UD_R_DR6 = 97,
  UD_R_DR7 = 98,
  UD_R_DR8 = 99,
  UD_R_DR9 = 100,
  UD_R_DR10 = 101,
  UD_R_DR11 = 102,
  UD_R_DR12 = 103,
  UD_R_DR13 = 104,
  UD_R_DR14 = 105,
  UD_R_DR15 = 106,
  UD_R_MM0 = 107,
  UD_R_MM1 = 108,
  UD_R_MM2 = 109,
  UD_R_MM3 = 110,
  UD_R_MM4 = 111,
  UD_R_MM5 = 112,
  UD_R_MM6 = 113,
  UD_R_MM7 = 114,
  UD_R_ST0 = 115,
  UD_R_ST1 = 116,
  UD_R_ST2 = 117,
  UD_R_ST3 = 118,
  UD_R_ST4 = 119,
  UD_R_ST5 = 120,
  UD_R_ST6 = 121,
  UD_R_ST7 = 122,
  UD_R_XMM0 = 123,
  UD_R_XMM1 = 124,
  UD_R_XMM2 = 125,
  UD_R_XMM3 = 126,
  UD_R_XMM4 = 127,
  UD_R_XMM5 = 128,
  UD_R_XMM6 = 129,
  UD_R_XMM7 = 130,
  UD_R_XMM8 = 131,
  UD_R_XMM9 = 132,
  UD_R_XMM10 = 133,
  UD_R_XMM11 = 134,
  UD_R_XMM12 = 135,
  UD_R_XMM13 = 136,
  UD_R_XMM14 = 137,
  UD_R_XMM15 = 138,
  UD_R_RIP = 139,
  UD_OP_REG = 140,
  UD_OP_MEM = 141,
  UD_OP_PTR = 142,
  UD_OP_IMM = 143,
  UD_OP_JIMM = 144,
  UD_OP_CONST = 145,
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
