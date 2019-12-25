module class_cuboid
   implicit none
   private

   type, public :: cuboid
      real, private :: x_min, x_max, y_min, y_max, z_min, z_max
   end type cuboid

   interface cuboid
      module procedure cuboid_constructor_0
      module procedure cuboid_constructor_1
   end interface cuboid

contains
   function cuboid_constructor_0() result(this)
      type(cuboid) :: this

      this%x_min = -1.0
      this%y_min = -1.0
      this%z_min = -1.0

      this%x_max = 1.0
      this%y_max = 1.0
      this%z_max = 1.0
   end function cuboid_constructor_0

   function cuboid_constructor_1(x_min, x_max, y_min, y_max, z_min, z_max) result(this)
      type(cuboid) :: this
      real :: x_min, x_max, y_min, y_max, z_min, z_max

      this%x_min = x_min
      this%y_min = y_min
      this%z_min = z_min

      this%x_max = x_max
      this%y_max = y_max
      this%z_max = z_max
   end function cuboid_constructor_1

end module class_cuboid
