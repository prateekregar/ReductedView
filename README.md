# ReductedView
Swift/SwiftUI Project describing use of ReductedView

 
<details>
  <summary>Use case: </summary> 

  # Container
  ```swift
 VStack(alignment: .leading) {
            Text("Title")
                .font(.headline)
            Text("Subtitle")
                .font(.subheadline)
  }.padding()
  .redacted(reason: .placeholder)
```

 # View
```swift
Text("Title")
.redacted(reason: .placeholder)
```

</details>

<details>
<summary>OUTPUT </summary> 
  
![Simulator Screen Shot - iPhone 14 Pro - 2023-09-05 at 11 20 52](https://github.com/prateekregar/ReductedView/assets/26741028/a1f03ebb-e8c9-46cb-ab2a-7c1e41a9ea97)
</details>

