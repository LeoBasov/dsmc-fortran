module class_pusher

contains
   subroutine push(positions, velocities, time_step)
      real, dimension(:, :), intent(inout) :: positions
      real, dimension(:, :), intent(in) :: velocities
      real, intent(in) :: time_step

      positions = positions + velocities*time_step

   end subroutine push

end module class_pusher
