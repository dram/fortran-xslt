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
  end interface
end module xslt
