## config.json
### HTTP Outbound Parameters
#### max_alerts
- The maximum number of alerts that can be retrieved at once from a http request.
- Bounds are `0 <= max_alerts <= 800`

#### max_users
- The maximum number of users that can be retrieved at once from a http request.
- Bounds are `0 <= max_users <= 400`

#### max_jams
- The maximum number of traffic jams that can be retrieved at once from a http request.
- Bounds are `0 <= max_jams <= 200`

#### pos_top
- Top boundary of a coordinate radius, in degrees.
- A maximum of 14 decimal places are accepted.

#### pos_bottom
- Bottom boundary of a coordinate radius, in degrees.
- A maximum of 14 decimal places are accepted.

#### pos_left
- Left boundary of a coordinate radius, in degrees.
- A maximum of 14 decimal places are accepted.

#### pos_right
- Right boundary of a coordinate radius, in degrees.
- A maximum of 14 decimal places are accepted.

### HTTP Outbound Configuration
#### timeout_ms
- How long to wait between requests, in miliseconds.

### Database Configuration
#### coordinate_dp
- Maximum number of decimal places that coordinates will be rounded down to. All waypoint within this range will be appended to a single file, discoverable by a hash of the rounded coordinate.