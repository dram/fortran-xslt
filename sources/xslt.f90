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
     function xslt_apply_stylesheet(style, doc, params) &
          bind(c, name="xsltApplyStylesheet")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: style, doc, params
       type(c_ptr) xslt_apply_stylesheet
     end function xslt_apply_stylesheet

     function xslt_run_stylesheet_user( &
          style, doc, params, output, &
          sax, io_buf, profile, user_ctxt) &
          bind(c, name="xsltRunStylesheetUser")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: &
            style, doc, params, output, sax, io_buf, profile, user_ctxt
       integer(c_int) xslt_run_stylesheet_user
     end function xslt_run_stylesheet_user

     !! security
     !! ********
     function xslt_new_security_prefs() &
          bind(c, name="xsltNewSecurityPrefs")
       use iso_c_binding, only: c_ptr
       type(c_ptr) xslt_new_security_prefs
     end function xslt_new_security_prefs

     subroutine xslt_set_default_security_prefs(sec) &
          bind(c, name="xsltSetDefaultSecurityPrefs")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: sec
     end subroutine xslt_set_default_security_prefs

     !! xsltInternals
     !! *************
     function xslt_parse_stylesheet_file(filename) &
          bind(c, name="xsltParseStylesheetFile")
       use iso_c_binding, only: c_ptr
       type(c_ptr), value :: filename
       type(c_ptr) xslt_parse_stylesheet_file
     end function xslt_parse_stylesheet_file

     !! xsltutils
     !! *********
     function xslt_save_result_to_filename(url, result, style, compression) &
          bind(c, name="xsltSaveResultToFilename")
       use iso_c_binding, only: c_int, c_ptr
       type(c_ptr), value :: url, result, style
       integer(c_int), value :: compression
       integer(c_int) xslt_save_result_to_filename
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
