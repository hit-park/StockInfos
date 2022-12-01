//
//  ListView.swift
//  StockInfos
//
//  Created by 희태 박 on 2022/11/15.
//

import SwiftUI

struct ListView: UIViewRepresentable {

    private var vm: ListViewModel
    let count: Int = 10
    
    init(menu: Menu) {
        vm = ListViewModel(menu: menu)
    }
    
    func makeUIView(context: Context) -> UICollectionView {
        let cv: UICollectionView = .init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        cv.backgroundColor = .red
        cv.dataSource = context.coordinator
        cv.delegate = context.coordinator
        cv.register(ListItemCell.self, forCellWithReuseIdentifier: "Cell")
        return cv
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: UICollectionView, context: Context) {
        uiView.reloadData()
    }
}

class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var parent: ListView
    
    init(_ parent: ListView) {
        self.parent = parent
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return parent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ListItemCell else { return UICollectionViewCell() }
        cell.update(title: "asdfasdfasdf")
        return cell
    }
}

class ListItemCell: UICollectionViewCell {
    
    private let title: UILabel = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(title)
        contentView.backgroundColor = .green
        title.translatesAutoresizingMaskIntoConstraints = false
        title.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        title.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        title.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(title: String) {
        self.title.text = title
    }
}
