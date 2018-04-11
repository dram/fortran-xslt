module xslt
  implicit none

  interface
     !! extensions
     !! **********
     subroutine xslt_init_globals() &
          bind(c, name="xsltInitGlobals")
     end subroutine xslt_init_globals

     !! transform
     !! *********
     function xslt_apply_stylesheet(style, doc, params) result(res) &
          bind(c, name="xsltApplyStylesheet")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: style, doc
       type(c_ptr), intent(in) :: params (*)
       type(c_ptr) :: res
     end function xslt_apply_stylesheet

     function xslt_run_stylesheet_user( &
          style, doc, params, output, &
          sax, io_buf, profile, user_ctxt) result(res) &
          bind(c, name="xsltRunStylesheetUser")
       use iso_c_binding, only: c_char, c_int, c_ptr
       type(c_ptr), value :: style, doc, sax, io_buf, profile, user_ctxt
       character(kind=c_char), intent(in) :: output (*)
       type(c_ptr), intent(in) :: params (*)
       integer(c_int) :: res
     end function xslt_run_stylesheet_user

     !! security
     !! ********
     function xslt_new_security_prefs() result(res) &
          bind(c, name="xsltNewSecurityPrefs")
       use iso_c_binding, only: c_ptr
       type(c_ptr) :: res
     end function xslt_new_security_prefs

     subroutine xslt_set_default_security_prefs(sec) &
          bind(c, name="xsltSetDefaultSecurityPrefs")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: sec
     end subroutine xslt_set_default_security_prefs

     !! xsltInternals
     !! *************
     function xslt_parse_stylesheet_file(filename) result(stylesheet) &
          bind(c, name="xsltParseStylesheetFile")
       use iso_c_binding, only: c_char, c_ptr
       character(kind=c_char), intent(in) :: filename (*)
       type(c_ptr) :: stylesheet
     end function xslt_parse_stylesheet_file

     !! xsltutils
     !! *********
     function xslt_save_result_to_filename(url, result, style, compression) &
          result(bytes) &
          bind(c, name="xsltSaveResultToFilename")
       use iso_c_binding, only: c_char, c_int, c_ptr
       character(kind=c_char), intent(in) :: url (*)
       type(c_ptr), value :: result, style
       integer(c_int), value :: compression
       integer(c_int) :: bytes
     end function xslt_save_result_to_filename

     subroutine xslt_set_generic_debug_func(ctx, handler) &
          bind(c, name="xsltSetGenericDebugFunc")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: ctx, handler
     end subroutine xslt_set_generic_debug_func

     subroutine xslt_set_generic_error_func(ctx, handler) &
          bind(c, name="xsltSetGenericErrorFunc")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: ctx, handler
     end subroutine xslt_set_generic_error_func

  end interface
end module xslt
