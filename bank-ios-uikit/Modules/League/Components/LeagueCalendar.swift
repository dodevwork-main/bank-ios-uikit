//
//  LeagueCalendar.swift
//  bank-ios-uikit
//
//  Created by RYAZANTSEV Maksim on 15.06.2024.
//

import Foundation
import UIKit



protocol LeagueCalendarDelegate: AnyObject {
    func getDateCalendarsAndSelectedDate() -> (dateCalendars: DateCalendars, selectedCalendarDate: Date)?
    func pressBackwordButton()
    func pressForwordButton()
}

final class LeagueCalendar: UIView {
    
    weak var delegate: LeagueCalendarDelegate?
    
    private lazy var dateTabView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    private lazy var backwardButtonDateTab: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(handleBackwardButtonDateTabTouchUpInside), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var forwardButtonDateTab: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(handleForwardButtonDateTabTouchUpInside), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var labelDateTab: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Next"
        
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(LeagueCalendarCell.self, forCellReuseIdentifier: LeagueCalendarCell.identifier)
        tableView.separatorColor = .clear
        tableView.allowsSelection = false
        
        return tableView
    }()
    
    private lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Нет матчей на сегодня"
        label.isHidden = true
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        addSubview(dateTabView)
        addSubview(tableView)
        addSubview(emptyLabel)
        
        dateTabView.addSubview(backwardButtonDateTab)
        dateTabView.addSubview(forwardButtonDateTab)
        dateTabView.addSubview(labelDateTab)
        
        NSLayoutConstraint.activate([
            dateTabView.topAnchor.constraint(equalTo: topAnchor),
            dateTabView.leftAnchor.constraint(equalTo: leftAnchor),
            dateTabView.rightAnchor.constraint(equalTo: rightAnchor),
            
            backwardButtonDateTab.leftAnchor.constraint(equalTo: dateTabView.leftAnchor, constant: .mainPadding),
            backwardButtonDateTab.centerYAnchor.constraint(equalTo: dateTabView.centerYAnchor),
            
            forwardButtonDateTab.rightAnchor.constraint(equalTo: dateTabView.rightAnchor, constant: -.mainPadding),
            forwardButtonDateTab.centerYAnchor.constraint(equalTo: dateTabView.centerYAnchor),
            
            labelDateTab.centerXAnchor.constraint(equalTo: dateTabView.centerXAnchor),
            labelDateTab.topAnchor.constraint(equalTo: dateTabView.topAnchor),
            labelDateTab.bottomAnchor.constraint(equalTo: dateTabView.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: dateTabView.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: .mainPadding),
            tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -.mainPadding),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            emptyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emptyLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    func getSelectedCallerndars() -> [CalendarEntity] {
        guard let tuple = delegate?.getDateCalendarsAndSelectedDate(),
              let selectedDate = MainDate().getDateWithZeroTime(date: tuple.selectedCalendarDate) else { return [] }
        
        return tuple.dateCalendars[selectedDate] ?? []
    }
    
    func reload() {
        guard let tuple = delegate?.getDateCalendarsAndSelectedDate() else { return }
        
        labelDateTab.text = MainDate.dateFormatter.string(from: tuple.selectedCalendarDate)
        tableView.reloadData()
        
        if getSelectedCallerndars().count == 0 {
            tableView.isHidden = true
            emptyLabel.isHidden = false
        } else {
            tableView.isHidden = false
            emptyLabel.isHidden = true
        }
    }
    
    @objc func handleBackwardButtonDateTabTouchUpInside() {
        delegate?.pressBackwordButton()
    }
    
    @objc func handleForwardButtonDateTabTouchUpInside() {
        delegate?.pressForwordButton()
    }
}

extension LeagueCalendar: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getSelectedCallerndars().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeagueCalendarCell.identifier, for: indexPath) as! LeagueCalendarCell
        
        cell.configure(calendar: getSelectedCallerndars()[indexPath.row])
        
        return cell
    }
}
