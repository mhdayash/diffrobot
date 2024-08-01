include "map_builder.lua"
include "trajectory_builder.lua"

options = {
  map_builder = MAP_BUILDER,
  trajectory_builder = TRAJECTORY_BUILDER,
  map_frame = "map",
  tracking_frame = "base_footprint",
  published_frame = "odom",
  odom_frame = "odom",
  provide_odom_frame = false,
  publish_frame_projected_to_2d = true,
  use_odometry = true,
  use_nav_sat = false,
  use_landmarks = false,
  num_laser_scans = 1,
  num_multi_echo_laser_scans = 0,
  num_subdivisions_per_laser_scan = 1,
  num_point_clouds = 0,
  lookup_transform_timeout_sec = 0.5,  -- Increased timeout for transform lookup
  submap_publish_period_sec = 0.1,     -- Increased frequency for submap publishing
  pose_publish_period_sec = 0.01,      -- Increased frequency for pose publishing
  trajectory_publish_period_sec = 0.02, -- Increased frequency for trajectory publishing
  rangefinder_sampling_ratio = 1.,
  odometry_sampling_ratio = 1.,
  fixed_frame_pose_sampling_ratio = 1.,
  imu_sampling_ratio = 1.,
  landmarks_sampling_ratio = 1.,
}

MAP_BUILDER.use_trajectory_builder_2d = true

TRAJECTORY_BUILDER_2D.min_range = 0.3
TRAJECTORY_BUILDER_2D.max_range = 12.0 -- Adjust if LIDAR has a longer range
TRAJECTORY_BUILDER_2D.missing_data_ray_length = 3.
TRAJECTORY_BUILDER_2D.use_imu_data = false
TRAJECTORY_BUILDER_2D.use_online_correlative_scan_matching = false  -- Disabled to test if it helps with distortion
TRAJECTORY_BUILDER_2D.motion_filter.max_angle_radians = math.rad(0.2) -- Increased to handle larger angles

POSE_GRAPH.constraint_builder.min_score = 0.75 -- Increased for better constraints
POSE_GRAPH.constraint_builder.global_localization_min_score = 0.8 -- Increased for better global localization

-- POSE_GRAPH.optimize_every_n_nodes = 0 -- Uncomment if optimization needs to be adjusted

return options
