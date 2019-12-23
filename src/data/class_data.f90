module class_data
  implicit none

  type :: Data
  contains
    final :: destructor
  end type data

  interface Data
    procedure :: constructor
end interface

contains
  subroutine destructor(this)
        type(Data) :: this
        print *, 'Destructor of my_type object with address: '
      end subroutine destructor

  function constructor(size) result(this)
    type(Data) :: this
    integer :: size
    print*, "CONSTRUCTOR HAVE BEEN CALLED"
  end function constructor

end module class_data
