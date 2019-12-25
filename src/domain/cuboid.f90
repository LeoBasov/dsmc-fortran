module class_cuboid
   implicit none
   private

   type, public :: cuboid
      real, private :: x_min, x_max, y_min, y_max, z_min, z_max

   contains
      procedure :: set
      procedure :: volume
      procedure :: inside
   end type cuboid

   interface cuboid
      module procedure cuboid_constructor_0
      module procedure cuboid_constructor_1
   end interface cuboid

contains
   function cuboid_constructor_0() result(this)
      type(cuboid) :: this

      call this%set(-1.0, 1.0, -1.0, 1.0, -1.0, 1.0)
   end function cuboid_constructor_0

   function cuboid_constructor_1(x_min, x_max, y_min, y_max, z_min, z_max) result(this)
      type(cuboid) :: this
      real :: x_min, x_max, y_min, y_max, z_min, z_max

      call this%set(x_min, x_max, y_min, y_max, z_min, z_max)
   end function cuboid_constructor_1

   subroutine set(this, x_min, x_max, y_min, y_max, z_min, z_max)
      class(cuboid), intent(inout) :: this
      real, intent(in) :: x_min, x_max, y_min, y_max, z_min, z_max

      this%x_min = x_min
      this%y_min = y_min
      this%z_min = z_min

      this%x_max = x_max
      this%y_max = y_max
      this%z_max = z_max
   end subroutine set

   function volume(this) result(val)
      class(cuboid), intent(in) :: this
      real :: val

      val = (this%x_max - this%x_min)*(this%y_max - this%y_min)*(this%z_max - this%z_min)
   end function volume

   function inside(this, position) result(val)
      class(cuboid), intent(in) :: this
      real, dimension(3), intent(in) :: position
      logical :: val, x_in, y_in, z_in

      x_in = (position(1) >= this%x_min) .and. (position(1) <= this%x_max)
      y_in = (position(2) >= this%y_min) .and. (position(2) <= this%y_max)
      z_in = (position(3) >= this%z_min) .and. (position(3) <= this%z_max)

      val = x_in .and. y_in .and. z_in
   end function inside

end module class_cuboid
