program main
  use iso_c_binding

  implicit none

  block
    use xslt

    call xslt_init_globals()
  end block
end program main
