void main()
{
  import udis86.c;
  import core.stdc.string;
  import core.stdc.stdio;

  ubyte[] bytes = [0x65, 0x67, 0x89, 0x87, 0x76, 0x65, 0x54, 0x56, 0x78, 0x89, 0x09, 0x00];

  ud_t ud_obj;

  ud_init(&ud_obj);
  ud_set_input_buffer(&ud_obj, bytes.ptr, bytes.length);
  ud_set_mode(&ud_obj, 32);
  ud_set_syntax(&ud_obj, UD_SYN_INTEL);

  while (ud_disassemble(&ud_obj))
  {
    printf("%s\n", ud_insn_asm(&ud_obj));
  }
}
