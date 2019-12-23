module class_data
   implicit none

   type :: Data
      real, dimension(:, :), allocatable :: positions, velocities
   contains
      final :: destructor
   end type data

   interface Data
      procedure :: constructor
   end interface

contains
   subroutine destructor(this)
      type(Data) :: this
      if (ALLOCATED(this%positions)) deallocate (this%positions)
      if (ALLOCATED(this%velocities)) deallocate (this%velocities)
   end subroutine destructor

   function constructor(size) result(this)
      type(Data) :: this
      integer, intent(in) :: size
      allocate (this%positions(size, 3))
      allocate (this%velocities(size, 3))
   end function constructor

end module class_data
